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

public class Sketch_Demo_03_SmileyWorld extends PApplet {

Smiley[]smileArr=new Smiley[10];

PImage sourceImg;
public void setup() {
  /*Create the smiley class array and assign 10 Smiley objects to the array, 
   filled with random values for the position and the image diameter passed as 
   arguments to the constructor.*/
  sourceImg = loadImage("Smileys.png");
  //Smiley(float xPos, float yPos, PImage imgSmiley)
  for (int i=0; i<smileArr.length; i++) {
    smileArr[i]=new Smiley(random(0, width), random(0, height), sourceImg);
    smileArr[i].diameter=50;
  }
  
}
public void draw() {
  background(255);
    /* 
   - Move each smiley by calling their move-method
   - set the highest smiley
   - display each smiley by calling their display-method with a correct image*/
  for (int i=0; i < smileArr.length; i++){
  smileArr[i].move();
  smileArr[i].display();
  for( int j=0;j < smileArr.length; j++){
    smileArr[j].setHighest(false);
  }
  getHighestSmiley().setHighest(true);
  
  //println(smileArr[i].speed);
  
  }
}

public void keyPressed() {
  //- increase the speed of all smileys when the UP-key is pressed
  if (keyCode == UP){
  for (int i=0; i<smileArr.length; i++){
  smileArr[i].increaseSpeed();
  }
  }
  //- decrease the speed of all smileys when the DOWN-key is pressed
  if (keyCode == DOWN){
  for (int i=0; i<smileArr.length;i++){
  smileArr[i].decreaseSpeed();
  }
  }
}

public void mousePressed() {
  //call the hitTest method passing the mouse position as arguments when the left mouse is pressed
  if (mouseButton == LEFT){
  for (int i=0; i<smileArr.length; i++){
  smileArr[i].hitTest(mouseX,mouseY);
  }
  }
}

public Smiley getHighestSmiley(){
  
/*The awake smiley at the highest position should show the happy smiley.
 Make a function that determines which awake smiley is at the highest position 
 (use getYPosition()). 
 The one with the smallest y-value is situated at the highest position.
 Call this function in the draw and notify the resulting smiley (using setHighest)
 that it is at the highest position. Mind that the previous highest smileys are no 
 longer at the highest position, thus also change the data member isHighest for these
 ones (TIP: looping over the array and setting the data member to false, using the 
 setter-method).*/
   float minYValue=height;
   int minIndex = 0;
   for( int i = 0; i < smileArr.length;i++){
    if ((smileArr[i].getYPosition() < minYValue) && (smileArr[i].isSleeping==false)){
      minYValue = smileArr[i].getYPosition();
      minIndex = i;
    } 
   }
        print("min value is " + minYValue);
  println("and highest awake smiley is index number " + minIndex);
   return smileArr[minIndex];

 }
 
class Smiley {
  //data members
  private float xPos, yPos, diameter, speed=random(60, 180), xDirection=random(3), yDirection=random(5);
  private int border=20;
  private PImage imgSmiley, imgSprite;
  private boolean isHighest=false, isSleeping=false;

  //constructor
  Smiley(float xPos, float yPos, PImage imgSmiley) {
    this.xPos=xPos;
    this.yPos=yPos;
    this.imgSmiley=imgSmiley;
  }
  /*adjust the position variables and make the smiley bouncing the borders. 
   You will notice that the smileys go very fast. Each frame the position changes,
   so multiply the position with 1/framerate, so he changes it only once in 1 second!*/
  public void move() {
    xPos+=xDirection;
    yPos+=yDirection;
    if(xPos <= diameter/2 || xPos >= width-diameter/2){
    xDirection*=-1;
    }
    if(yPos <= diameter/2 || yPos >= height-diameter/2){
    yDirection*=-1;
    }
  }
  /*Draws the part of the bitmap according to its state:
   o If the smiley is at the highest position (isHighest is true), then the happy smiley is drawn.
   o If the smiley is near the screen boundaries (20 pixels border), the scared smiley is drawn.
   If the smiley is sleeping, the sleeping smiley is drawn
   o If none of the above conditions is met, the neutral smiley should be drawn.*/
  public void display() {
    imageMode(CENTER);
    //happy smile
    if (isHighest==true) {
      imgSprite = imgSmiley.get(0, 0, PApplet.parseInt(diameter), PApplet.parseInt(diameter));
      image(imgSprite, xPos, yPos);
    }
         // sleeping smile
     else if (isSleeping==true) {
      imgSprite = imgSmiley.get(150, 0, PApplet.parseInt(diameter), PApplet.parseInt(diameter));
      image(imgSprite, xPos, yPos);
    }
      //scared smile
    else if ((xPos < ((diameter/2)+border) || xPos > width-((diameter/2)+border)) || (yPos < ((diameter/2)+border) || yPos > height-((diameter/2)+border))) {
      imgSprite = imgSmiley.get(100, 0, PApplet.parseInt(diameter), PApplet.parseInt(diameter));
      image(imgSprite, xPos, yPos);
    }
     // else if (yPos < 45 || yPos > height-45) {
     // imgSprite = imgSmiley.get(100, 0, int(diameter), int(diameter));
     // image(imgSprite, xPos, yPos);
     // }

    //neutral smile
    else {
      imgSprite = imgSmiley.get(50, 0, PApplet.parseInt(diameter), PApplet.parseInt(diameter));
      image(imgSprite, xPos, yPos);
    }
  }

  public void increaseSpeed() {
    speed=speed*1.05f;
  }
  public void decreaseSpeed() {
    speed=speed/1.05f;
  }
  //get from lights ex, change boolean isSleeping
   public void hitTest(float mx, float my){
    if (mx>=xPos-(diameter/2)&& mx<=xPos+(diameter/2)&& my>=yPos-(diameter/2) && my<=yPos+(diameter/2)) {
      isSleeping=!isSleeping;
    }     
 }
  public float getYPosition() {
    return yPos;
  }
  //this method sets the data member “isHighest” of the object for being the highest to true.
  public void setHighest(Boolean highest) {
    isHighest = highest;
  }
}
  public void settings() {  size(842, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Demo_03_SmileyWorld" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
