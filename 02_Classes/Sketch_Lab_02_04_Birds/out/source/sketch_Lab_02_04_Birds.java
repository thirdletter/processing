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

public class sketch_Lab_02_04_Birds extends PApplet {

//initialize vars and objects
Bird twitter,vogel;
int var1;
float var2;

//setup runs once at start of program
public void setup() {
  
  //load objects with data if needed
  // args : String filename, int numFrames, float xPos, float yPos, int speed
  twitter = new Bird("twitter-bird-sprite.jpg",4,20,20,9);
  vogel = new Bird("sprite1.jpg",14,20,200,1);
}

//draw is executed every frame, 60fps by default
public void draw() {
   background(255);
  twitter.display();
  vogel.display();
  twitter.update();
  vogel.update();
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the key variable
public void keyPressed() {
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
public void mousePressed() {
}
//initialize class and variables
class Bird {
  private float xPos, yPos, frameTime = 1/8.0f, totalTime;
  private int speed, numFrames, frameCounter, frameWidth, frameHeight;
  private PImage imgSprite,imgSrc;

  //constructor
  Bird(String filename, int numFrames, float xPos, float yPos, int speed) {
    this.numFrames = numFrames;
    this.xPos = xPos;
    this.yPos = yPos;
    this.speed = speed;
    imgSrc = loadImage(filename);
  }

  //display
  public void display() {
    //dynamically adjusts the width and height of imgSprite based on arguments provided when bird/object is created
    frameWidth = imgSrc.width / numFrames;
    frameHeight = imgSrc.height;
    //get grabs part of the original image and stores it into imgSprite
    imgSprite = imgSrc.get(frameCounter * frameWidth, 0, frameWidth, frameHeight);
    image(imgSprite, xPos, yPos);
  }

//updates the framecounter and xpos to show the right image
public void update(){
 totalTime+=1/60.0f;
 if (totalTime>frameTime){
 frameCounter++;
 totalTime=0;
 }
 frameCounter%=numFrames;
 xPos+=speed;
 if (xPos>=width){
 xPos=0;
 }
}
  //example of method that returns something
  public int method2() {https://i.imgur.com/EsYF5aU.png
    var1+=var2;
    return var1;
  }

  //getter
  public int getVar1() {
    return var1;
  }

  //setter
  public void setVar1(int set1) {
    var1=set1;
  }
}
  public void settings() {  size(842, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_Lab_02_04_Birds" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
