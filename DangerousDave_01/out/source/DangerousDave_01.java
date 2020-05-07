import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class DangerousDave_01 extends PApplet {

//initialize vars and objects
PImage emptyImg,daveImg, diaImg, cupImg, doorImg, pipeImg, solidImg, gemImg, redDiaImg;
Dave dave;
World world;

//setup runs once at start of program
public void setup() {
  
   loadAssets();
}

//draw is executed every frame, 60fps by default
public void draw() {
  background(68,36,52);
    dave.physics();
    for (int i=0; i<world.numTilesH; i++) { // for each column
        for (int j=0; j<world.numTilesV; j++) { // for each tile in that column
           dave.collision(world.currentLevel[j][i]);
           if (world.currentLevel[j][i].getTaken()){ //check if the tile has been taken by the player
             //and change the current tile to an empty tile if that is the case
             world.currentLevel[j][i] = new Empty(new PVector(i*world.tileSize, j*world.tileSize), emptyImg);
           }
      }
    }
  world.display();
  dave.display();
  showHUD();
}


//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
public void keyPressed() {
  if (keyCode==LEFT){
   dave.pressLeft(true); 
  }
  if (keyCode==RIGHT){
   dave.pressRight(true); 
  }
  if (keyCode==UP){
   dave.jump(); 
  }
}

public void keyReleased(){
    if (keyCode==LEFT){
   dave.pressLeft(false); 
  }
  if (keyCode==RIGHT){
   dave.pressRight(false); 
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
public void mousePressed() {
}

//load images
private void loadAssets() {
  //images
  emptyImg = loadImage("emptySprite.png");
  daveImg = loadImage("walkSprite.png");
  diaImg = loadImage("diaSprite.png");
  cupImg = loadImage("cupSprite.png");
  doorImg = loadImage("doorSprite.png");
  pipeImg = loadImage("pipeSprite.png");
  solidImg = loadImage("solidSprite.png");
  gemImg = loadImage("gemSprite.png");
  redDiaImg = loadImage("redDiaSprite.png");
  //objects
  dave = new Dave(daveImg);
  world = new World();
  world.loadlevel1();
}

public void showHUD(){
  textSize(30);
  textAlign(LEFT);
  text("Score: "+dave.getScore(), 20,35);
  textAlign(CENTER);
  text("Level: " + world.getLevel() , width/2,35);
  textAlign(RIGHT);
  text("Daves: " + dave.getCurLives() , width-20,35);
}
class Cup extends Tile{

  Cup(PVector pos, PImage tileImg){
    super (pos, tileImg);
  }
  
}
class Dave { //<>//
  private int numElements=3;
  private PImage[] arrImg;
  private int maxLives, curLives, score;
  private float friction;
  private PVector pos, accel, velocity;
  private boolean leftPressed, rightPressed, isJumping;

  public Dave(PImage daveImg) {
    pos = new PVector();
    accel = new PVector();
    velocity = new PVector();
    this.maxLives = 3;
    this.curLives = maxLives;
    this.friction = 1;
    //set arraysize to number of images
    arrImg = new PImage[numElements];
    //cut source image into equally wide pieces, and store them in arrImg
    for (int i=0; i<numElements; i++) {
      arrImg[i]=daveImg.get((daveImg.width/numElements)*i, 0, daveImg.width/numElements, daveImg.height);
    }
  }

  public void display() {
    if ( accel.x < 0) {  //goes left
      image(arrImg[0], pos.x, pos.y);
    }
    if (accel.x == 0) {  //does not move horizontal 
      image(arrImg[1], pos.x, pos.y);
    }
    if (accel.x > 0) {  //goes right
      image(arrImg[2], pos.x, pos.y);
    }
  }

  public void collision(Tile tile) {
    float distX = (this.pos.x + 55/2) - (tile.pos.x + world.getTileSize()/2);
    float distY = (this.pos.y + 58/2) - (tile.pos.y + world.getTileSize()/2);
    float combinedHalfWidths = 58/2 + world.getTileSize()/2;
    float combinedHalfHeights = 58/2 + world.getTileSize()/2;
    float overlapX = world.getTileSize() - abs(distX);
    float overlapY = world.getTileSize() - abs(distY);
    if (abs(distX) < combinedHalfWidths) {
      //collision on x, check to see if y collides
      if (abs(distY) < combinedHalfHeights) {
        //they are colliding
        if (tile instanceof Dia || tile instanceof Gem) {
          //need to find a solution so each diamond only counts once and is replaced with emptytile as soon as we pick it up.
          this.addScore(tile.getPoints());
          tile.setTaken();
        }
        //wallCollision
        if (tile instanceof Solid || tile instanceof Pipe) {     
          //find how much they overlap on each axis
          //collision is happening on the axis with least amount of overlap
          if (overlapX >= overlapY) {
            if (distY > 0) {
              //top edge of player
              this.pos.y += overlapY;
              this.velocity.y = 0;
            }else if (distY < world.getTileSize()) {
              //bottom edge of player
              this.pos.y -= overlapY;
              this.velocity.y = 0;
              isJumping = false;
            }
          }else if (overlapX < overlapY) {
            if (distX > 0) {
              //Left edge of player
              this.pos.x += overlapX;
              this.velocity.x = 0;
            }else if (distX < world.getTileSize()) {
              //right edge of player
              this.pos.x -= overlapX;
              this.velocity.x = 0;
            }
          }
        }
      }
    }
  }

  public void physics() {
    //reset acceleration !! NOT EQUALS TO VELOCITY !!
    //to prevent exponential increases in velocity
    accel.x = 0;
    //Check if player currently is pressing left or right, and increase/decrease accel accordingly
    if (leftPressed) {
      accel.x -= 0.1f;
      friction = 1; //no friction
    } else if (rightPressed) {
      accel.x += 0.1f;
      friction = 1; //no friction
    } else if (!leftPressed && !rightPressed) { // no horizontal key pressed
      accel.x -= 0; // dont change accel
      friction = 0.96f; // add friction
    }
    //acceleration in y direction is gravity and constant, friction is calculated
    accel.y = 0.32f; //gravity
    velocity.x *= friction; // calculate friction
    if (velocity.x <= 0.09f && velocity.x >= -0.09f) { //added this to make him stop completely, because friction goes infinitely close to 0 but never exactly 0
      velocity.x = 0;
    }
    //check if player is jumping
    //if (velocity.y == 0) {
    //  isJumping = false;
    //}
    //add acceleration to respective velocity
    velocity.x += accel.x;
    velocity.y += accel.y;
    //add velocity to respective position
    pos.x += velocity.x;
    pos.y += velocity.y;
  }
  public void pressLeft(boolean bool) {
    leftPressed = bool;
  }
  public void pressRight(boolean bool) {
    rightPressed = bool;
  }
  public void jump() {
    if (isJumping == false) {
      isJumping = true;
      velocity.y = -10;
    }
  }
  public int getCurLives() {
    return curLives;
  }
  public int getScore() {
    return score;
  }
  public void addScore(int newScore) {
    score += newScore;
  }
}
class Dia extends Tile{

  Dia(PVector pos, PImage tileImg){
    super (pos, tileImg);
    setPoints(150);
  }
  
}
class Door extends Tile{

  Door(PVector pos, PImage tileImg){
    super (pos, tileImg);
  }
  
}
class Empty extends Tile{

  Empty(PVector pos, PImage tileImg){
    super (pos, tileImg);
  }
  
}
class Gem extends Tile{

  Gem(PVector pos, PImage tileImg){
    super (pos, tileImg);
    setPoints(1000);
  }
  
}
class Pipe extends Tile{

  Pipe(PVector pos, PImage tileImg){
    super (pos, tileImg);
  }
  
}
class Solid extends Tile{

  Solid(PVector pos, PImage tileImg){
    super (pos, tileImg);
  }
  
}
abstract class Tile{
  protected PVector pos;
  protected PImage tileImg;
  protected int points;
  protected boolean isTaken;
  
  
  Tile(PVector pos, PImage tileImg){
    this.pos=pos;
    this.tileImg=tileImg;
  }
  
  public void display(){
    imageMode(CORNER);
    image(tileImg,pos.x,pos.y);
    }
  //getters and setters
  public float getTop(){
    return pos.y;
  }
  public float getBottom(){
    return pos.y+tileImg.height;
  }
  public float getLeft(){
    return pos.x;
  }
  public float getRight(){
    return pos.x+tileImg.width;
  }
  public void setTop(float newTop){
    pos.y = newTop;
  }
  public void setBottom(float newBottom){
    pos.y = newBottom;
  }
  public void setLeft(float newLeft){
    pos.y = newLeft;
  }
  public void setRight(float newRight){
    pos.y = newRight;
  }
  public int getPoints(){
    return points;
  }
  public void setPoints(int newPoints){
    points = newPoints;
  }
  
  public void setTaken(){
    isTaken = true;
  }
  
  public boolean getTaken(){
    return isTaken;
}
}
class World {
  //initialize vars and objects
  //numbers used to determine what numbers correspond to what tile
  final int emptyTile = 0;
  final int solidTile = 1;
  final int diaTile = 2;
  final int cupTile = 3;
  final int fireTile = 4;
  final int waterTile = 5;
  final int doorTile = 6;
  final int playerTile = 7;
  final int pipeTile = 8;
  final int gemTile = 9;
  final int redDiaTile = 10;
  //size of one tile and number of tiles both Horizontal and Vertical 
  final int tileSize = 60;
  final int numTilesH = 19;
  final int numTilesV = 10;
  int level;
  Tile[][] currentLevel = new Tile[numTilesV][numTilesH]; //creates a 2D array with amount of tiles we need
  //describes all the tiles we need for the first level
  int[][] level1 = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1}, 
    {1, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 1}, 
    {1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1}, 
    {1, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 1}, 
    {1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1}, 
    {1, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1}, 
    {1, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  };

  //constructor
  World() {
  }
  public void display() {
    for (int i=0; i<numTilesH; i++) { // for each column
      for (int j=0; j<numTilesV; j++) { // for each tile in that column
         currentLevel[j][i].display();
      }
    }
  }
  public void loadlevel1() {   
    this.level = 1;
    for (int i=0; i<numTilesH; i++) {
      for (int j=0; j<numTilesV; j++) {
        if (level1[j][i] == emptyTile) {
          currentLevel[j][i] = new Empty(new PVector(i*tileSize, j*tileSize), emptyImg);
        }
        if (level1[j][i] == solidTile) {
          currentLevel[j][i] = new Solid(new PVector(i*tileSize, j*tileSize), solidImg);
        }
        if (level1[j][i] == diaTile) {
          currentLevel[j][i] = new Dia(new PVector(i*tileSize, j*tileSize), diaImg);
        }
        if (level1[j][i] == cupTile) {
          currentLevel[j][i] = new Cup(new PVector(i*tileSize, j*tileSize), cupImg);
        }
        if (level1[j][i] == fireTile) {
          //currentLevel[j][i] = new Fire(new PVector(i*tileSize,j*tileSize),fireImg);
        }
        if (level1[j][i] == waterTile) {
          //currentLevel[j][i] = new Water(new PVector(i*tileSize,j*tileSize),waterImg);
        }
        if (level1[j][i] == doorTile) {
          currentLevel[j][i] = new Door(new PVector(i*tileSize, j*tileSize), doorImg);
        }
        if (level1[j][i] == playerTile) { // player start position, create empty tile and place Dave here
          currentLevel[j][i] = new Empty(new PVector(i*tileSize, j*tileSize), emptyImg);
          dave.pos.x = (i*tileSize);
          dave.pos.y = (j*tileSize);
        }
        if (level1[j][i] == pipeTile) {
          currentLevel[j][i] = new Pipe(new PVector(i*tileSize, j*tileSize), pipeImg);
        }
        if (level1[j][i] == gemTile) {
          currentLevel[j][i] = new Gem(new PVector(i*tileSize, j*tileSize), gemImg);
        }
        if (level1[j][i] == redDiaTile) {
          currentLevel[j][i] = new Dia(new PVector(i*tileSize, j*tileSize), redDiaImg);
        }
      }
    }
  }
   public int getLevel(){
   return level; 
  }
  public int getTileSize(){
    return tileSize;
  }
}
  public void settings() {  size(1140, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "DangerousDave_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
