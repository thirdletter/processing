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

public class Sketch_Lab_03_04_Jackpot extends PApplet {

//initialize vars and objects
PFont BelinSans;
PImage imgCandy, imgFruits, imgIcons;
long timer; // datatpye long is an integer, but with a much larger range. (64bit int vs 32bit int)
int score, wait = 2000; // how long the game has to be live in milliseconds
boolean gameStarted, gameEnded;
Jackpot row1, row2, row3;
//setup runs once at start of program
public void setup() {
  
  //load fonts and images into corresponding vars
  BelinSans = loadFont("BerlinSansFBDemi-Bold-100.vlw");
  imgCandy = loadImage("candy.jpg");
  imgFruits = loadImage("fruits.jpg");
  imgIcons = loadImage("icons.jpg");
  //fill objects with data
  //Jackpot(int xPos, int yPos, PImage img, int numElements)
  row1 = new Jackpot(50, 120, imgIcons, 5);
  row2 = new Jackpot(50, 290, imgFruits, 6);
  row3 = new Jackpot(50, 480, imgCandy, 6);
  //generate random numbers once to start sketch randomized
  row1.numGen();
  row2.numGen();
  row3.numGen();
}

//draw is executed every frame, 60fps by default
public void draw() {
  background(0);
  //set font stuff
  fill(211, 0, 184);
  textFont(BelinSans, 60);
  textAlign(CENTER);
  text("JACKPOT", 300, 75);
  //display 3 sets of images
  row1.display();
  row2.display();
  row3.display();
  //display start button if game is not live
  if (gameStarted == false) {
    fill(211, 0, 184);
    rect(200, 650, 200, 50);
    fill(0);
    textFont(BelinSans, 32);
    text("START", 300, 685);
  }
  //generate random numbers if game is live
  if (gameStarted == true) {
    if (millis() < (timer+wait)) { //millis() is amount of millisecond since sketch started., this if statement runs for 2sec then stops.
      row1.numGen();
      row2.numGen();
      row3.numGen();
    } else { // making sure to reset gameStarted value after we stop generating numbers, and tell program game has ended.
      gameStarted = false;
      gameEnded = true;
    }
  }
  if (gameEnded == true) {
    score = row1.result()+row2.result()+row3.result(); //add up score from all 3 rows
    //fill screen with semi transparant rect
    fill(0, 185);
    rect(0, 0, width, height);
    //write resulting score to screen
    fill(255, 255);
    textFont(BelinSans, 26);
    text("You won "+score+" credits!", 300, 375);
    text("Play again (Press the r-key)!", 300, 425);
  }
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the key variable
public void keyPressed() {
  if (key == 'r' || key == 'R') {
    gameEnded=false;
    score=0;
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
public void mousePressed() {
  if (mouseButton == LEFT) {
    //set timer to amount of milliseconds since sketch started, only when game is ready to be started.
    if (gameStarted == false && gameEnded == false) {
      timer = millis();
      gameStarted = true;
    }
  }
}
//initialize class and variables
class Jackpot {
  private int xPos, yPos, numElements, credits;
  private PImage img, imgSprite;
  /*
  PROBLEM:still have to figure out how to fix out of bounds issue if numElements > 6. presumably append function related.
  can technically call imgArr[5] which crashes if you use imgIcons because numElements is smaller than arraysize.
  maybe find a way to only create array after numElements is known and dynamically link it outside of constructor?
  
  SOLUTION:You are allowed to initialize an array without declaring a size, create array in constructor so you can give correct # of elements.
 */
  PImage[] imgArr;
  int[] numbers = new int[3];

  //Constructor
  Jackpot(int xPos, int yPos, PImage img, int numElements) {
    //link vars
    this.xPos = xPos;
    this.yPos = yPos;
    this.numElements = numElements;
    this.img = img;
    imgArr = new PImage[numElements];
    //cut sourceimage into equal pieces, dependant on image width and numElements, then store them in array.
    for (int i = 0; i < numElements; ++i) {
      imgArr[i] = img.get(i * (img.width/numElements), 0, (img.width/numElements), img.height);
    }
  }

  public void display() {
    //draw 3 images horizontally, image displayed is decided by data in numbers[].
    image(imgArr[numbers[0]], xPos, yPos);
    image(imgArr[numbers[1]], xPos+180, yPos);
    image(imgArr[numbers[2]], xPos+360, yPos);
  }

  public void numGen() {
    //fill array with random numbers.
    for ( int i=0; i < numbers.length; i++) {
      numbers[i] = (int)random(0, numElements);
    }
  }
  public int result() {
    /*
     Checks if images are the same and returns the right amount of credits accordingly.
     Scoring system is as follows:
     All 3 images = 100 credits
     2 images = 20 credits
     */
    credits = 0;
    if (numbers[0] == numbers[1] && numbers[1] == numbers[2]) { //checks if all images are the same
      credits = 100;
    } else if (numbers[0] == numbers[1] || numbers[1] == numbers[2]) { // checks if 2 images are the same
      credits = 20;
    }
    return credits;
  }
}
  public void settings() {  size(600, 750); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Lab_03_04_Jackpot" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
