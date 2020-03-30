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

public class Lab_06_02_Mobs extends PApplet {

//declaration of vars and objects
PImage bgImg, minionImg, jumperImg, bossImg, bulletImg, turretImg;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<GameObject> mobs = new ArrayList<GameObject>();
private int points;
Turret turret;
int groundHeight = 126;

public void setup() {
  
  //load all images and create first set of mobs and a turret
  loadImages();
  mobs.add(createMinion());
  mobs.add(createJumper());
  mobs.add(createBoss());
  turret = createTurret();
}

//dont forget to add the 6 images to the sketch!!
private void loadImages() {
  bgImg = loadImage("bg.png");
  minionImg = loadImage("minion.png");
  jumperImg = loadImage("jumper.png");
  bossImg = loadImage("boss.png");
  turretImg = loadImage("turret.png");
  bulletImg = loadImage("bullet.png");
}

public void draw() {
  background(bgImg); //set bg

  for (GameObject mob : mobs) { //move and display all mob objects
    mob.move();
    mob.display();
  }

  turret.display(); //display the turret

  for (Bullet bullet : bullets) { //display and move all bullet objects
    bullet.display();
    bullet.move();
  }

  testBulletsMobsHit();
  testMobsTurretHit();

  removeBullets(); //removes bullets if health is 0 or exits screen
  removeMobs(); //removes mobs if health is 0 or exits screen

  addMob(); // adds a mob every 2sec
  showHUD(); // shows the HUD
  gameOver(); // checks to see if you have lives/bullets, ends game when either hits 0
}

private void gameOver() {
  if (turret.getHealth() <= 0 || turret.getRemainingBullets() <= 0) { //if bullets or hp = 0
    textAlign(CENTER);
    textSize(72);
    text("GAME OVER!", width/2, height/2);
    textSize(48);
    text("YOU SCORED " + points + " POINTS!", width/2, (height/2)+50);
    noLoop();
  }
}

private void showHUD() { //displays 3 datatexts
  fill(0);
  textAlign(LEFT, CENTER);
  text("Health: " + turret.getHealth(), 10, 30);
  text("Points: " + points, 10, 50);
  text("Bullets: " + turret.getRemainingBullets(), 10, 70);
}

private void testMobsTurretHit() { //checks if a mob hits the turret
  for (GameObject mob : mobs) {
    if ( mob.getHealth() > 0 && turret.getHealth() > 0  && mob.hitDetection(turret)) { // if mob and turret are alive and you hit the turret
      turret.hit();
      mob.hit();
    }
  }
}

private void addMob() { // adds a random mob every 2 sec
  if (frameCount % ((int)(frameRate * 2)) == 0) { //frameRate is a float by default so we need to typecast to integer
    int i = (int)random(3); //random number between 0 and 2 for each of our mob types
    switch (i) {
    case 0 : 
      mobs.add(createMinion());
    case 1 : 
      mobs.add(createJumper());
    case 2 : 
      mobs.add(createBoss());
    default : //unsure of why we need a default case, because we never actually hit it?
    }
  }
}

private void removeMobs() { //remove mobs from arraylist if they leave the screen or hp is 0
  for (int i = mobs.size()-1; i>=0; i--) { //remove means looping backwards
    GameObject mob = mobs.get(i);
    if (mob.getRight() < 0 || mob.getHealth() <= 0) { // check if hp is 0 or pos is outside of screen
      mobs.remove(mob);
      points+= mob.getScore(); // note: if mob somehow made it past turret, we still would get points because it leaves teh screen and executes. does not occur in normal gameplay
    }
  }
}

private void removeBullets() { //remove bullets from arraylist if they leave the screen or hp is 0
  for (int i=bullets.size()-1; i >= 0; i--) { //remove means looping backwards
    Bullet bullet = bullets.get(i);
    if (bullet.getHealth() <= 0 || bullet.getLeft() > width) { //check bullet hp or if it left the screen
      bullets.remove(bullet);
    }
  }
}

private void testBulletsMobsHit() { //just a function that executes testBulletMobsHit (!! SINGULAR BULLET !!) for each bullet that exists.
  for (Bullet bullet : bullets) {
    testBulletMobsHit(bullet);
  }
}

private void testBulletMobsHit(Bullet bullet) { //function that takes a bullet and checks if it hits a mob, executes hit function of both bullet and mob if we get a hit
  for (GameObject mob : mobs) {
    if (bullet.getHealth() > 0 && bullet.hitDetection(mob)) {
      //we have a hit here
      bullet.hit();
      mob.hit();
    }
  }
}


//functions that add a mob of each type
public Minion createMinion() {
  return new Minion(width, height - groundHeight - minionImg.height, minionImg);
}
public Jumper createJumper() {
  return new Jumper(width, height - groundHeight - jumperImg.height, jumperImg);
}
public Boss createBoss() {
  return new Boss(width, height - groundHeight - bossImg.height, bossImg);
}
public Turret createTurret() {
  return new Turret(0, height - groundHeight - turretImg.height, turretImg, 100);
}


public void keyPressed() {
  if (key == ' ') { // shoot a bullet if spacebar is hit
    Bullet bullet = turret.shoot(bulletImg);
    if (bullet != null) { // check to see if .shoot actually returns an object to prevent crashes
      bullets.add(bullet);
    }
  }
}
public class Boss extends GameObject {

  //const
  public Boss(int x, int y, PImage picture) {
    super(x, y, picture); //call const of GameObject
    setSpeed(2);
    setHealth(10);
    setMaxHP(10);
    setScore(10);
  }
}
public class Bullet extends GameObject {

  //const
  public Bullet(int x, int y, PImage picture) {
    super(x, y, picture); //call const of GameObject
    setSpeed(-10); // moves it to the right instead of left
    setHealth(1);
    setMaxHP(1);
    setScore(1);
  }
}
public class Jumper extends GameObject {

  //data members
  private float velocityY; //current vertical speed
  private float gravity = 10;
  private float time = 0.4f; //frametime?
  private int groundY;

  //const
  public Jumper(int x, int y, PImage picture) {
    super(x, y, picture); //call const of GameObject
    setSpeed(5);
    setHealth(2);
    setMaxHP(2);
    setScore(2);
    velocityY = -random(50, 80);
    groundY = y;
  }

  private float DeltaVelocityY() {
    return time * gravity;
  }

  public void move() {
    super.move(); //!! this only moves horizontally !!

    //vertical movement calc
    velocityY += DeltaVelocityY();
    y =(int)(y + velocityY * time);
    if (y > groundY) { //if you are below groundlevel
      y = groundY;
      velocityY *= -1;
    }
  }
}
public class Minion extends GameObject {

  //const
  public Minion(int x, int y, PImage picture) {
    super(x, y, picture); //call const of GameObject
    setSpeed(3);
    setHealth(2);
    setMaxHP(2);
    setScore(1);
  }
}
public class Turret extends GameObject {
  private int remainingBullets;
  
  //const
  public Turret(int x, int y, PImage picture, int remainingBullets) {
    super(x, y, picture); //call const of GameObject
    setSpeed(0);
    setHealth(10);
    setMaxHP(10);
    setScore(1); //does not matter
    this.remainingBullets = remainingBullets;
  }
  
  public Bullet shoot(PImage bulletImg){
    if (remainingBullets > 0){
      remainingBullets--;
      Bullet bullet = new Bullet(this.getRight(), this.getTop(), bulletImg);
      return bullet;
    }
    return null; //return null object if no remainingbullets to prevent game crashing
  }
  
  //getters/setters
  public int getRemainingBullets(){
  return remainingBullets;
  }
  
  public void setRemainingBullets(int newBullets){
  remainingBullets = newBullets;
  }
}
public class GameObject {
  private int x, health, maxHP, speed, score;
  protected int y; //protected makes it accessible to subclasses
  private PImage picture;

  //const
  public GameObject(int x, int y, PImage picture) {
    this.x = x;
    this.y = y;
    this.picture = picture;
  }

  //move
  public void move() {
    x -= speed; //assume x is positive, move from right to left
  }

  //move
  public void display() {
    tint(255, (float)health/maxHP * 255); //health/maxHP returns a number between 0 and 1, times 255 because range is 0,255
    imageMode(CORNER); // is default, only used to be explicit.
    image(picture, x, y);
  }

  //hit
  public void hit() {
    health-=1;
  }

  //hit detection
  public boolean hitDetection(GameObject other) {
    //only interested in horizontal hit detection. jumping over it still counts as hit
      if (this.getRight() < other.getLeft()){ //left of the other object
      return false;
    }
      if (this.getLeft() > other.getRight()){ //right of the other object
      return false;
    } else { // if neither condition is met, you have a hit horizontally
      return true;
    }
  }

  //getters and setters
  public int getLeft() {
    return x;
  }

  public int getRight() {
    return getLeft() + picture.width;
  }

  public int getTop() {
    return y;
  }

  public int getBottom() {
    return getTop() + picture.height;
  }

  public int getHealth() {
    return health;
  }

  public int getMaxHP() {
    return maxHP;
  }

  public int getSpeed() {
    return speed;
  }

  public int getScore() {
    return score;
  }


  //no setters for x and y
  // they will be updated using move method and initially set by const.
  //no setter for image as image never changes

  public void setHealth(int newHP) {
    health = newHP;
  }

  public void setMaxHP(int newMax) {
    maxHP = newMax;
  }

  public void setSpeed(int newSpeed) {
    speed = newSpeed;
  }

  public void setScore(int newScore) {
    score = newScore;
  }
}
  public void settings() {  size(1024, 512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lab_06_02_Mobs" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
