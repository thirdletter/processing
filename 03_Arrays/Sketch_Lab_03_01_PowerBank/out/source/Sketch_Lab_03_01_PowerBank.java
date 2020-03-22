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

public class Sketch_Lab_03_01_PowerBank extends PApplet {

//initialize vars, arrays and objects
int size=10, totalPower=0;
Battery[] arrBattery = new Battery[size];

//setup runs once at start of program
public void setup() {
  
  //load array with  data
  for (int i=0; i< arrBattery.length; i++) {
    arrBattery[i] = new Battery(20+(50*i), 20);
  }
}

//draw is executed every frame, 60fps by default
public void draw() {
  background(0);
  for (int i=0; i< arrBattery.length; i++) {
    arrBattery[i].display();
  }
  //this executes once every second
  if (frameCount % 60 == 0) {
    for (int i=0; i< arrBattery.length; i++) {
      arrBattery[i].reducePower();
    }
  }
  //add up power values of every object
  for (int i=0; i< arrBattery.length; i++) {
    totalPower +=arrBattery[i].power;
  }
  //display total power
  text("Total power: "+totalPower, width/2-50, 250);
  //reset totalPower to 0, otherwise totalPower will be incorrect.
  totalPower=0;
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
public void keyPressed() {
  if (key == 'r' || key == 'R') {
    for (int i=0; i< arrBattery.length; i++) {
      arrBattery[i].raisePower();
    }
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
public void mousePressed() {
  if (mouseButton == RIGHT) {
    //stops draw from executing
    noLoop();
  } else if (mouseButton == LEFT) {
    //restarts draw
    loop();
  }
}
//initialize class and variables
class Battery {
  private float posX, posY, batWidth, batHeight, power;
  private float speed;

  //Constructor
  Battery(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    batHeight = 200;
    batWidth = batHeight/5;
    power = 100;
    speed = random(1, 6);
  }

  public void display() {
    noFill();
    stroke(255);
    rectMode(CORNER);
    //draw main rectangle
    rect(posX, posY, batWidth, batHeight);
    //draw battery top
    rect(posX+(batWidth/3), posY-(10), batWidth/3, 10);
    //color is greenish when power > 50
    if (power > 50) {
      fill(0, 120, 120);
      //color is blue when power between 50 and 26
    } else if (power <= 50 && power > 26) {
      fill(0, 0, 255);
      //color is red when power between 25 and 0
    } else if (power <= 25) {
      fill(255, 0, 0);
    }
    //draw power rectangle
    rect(posX, posY+batHeight, batWidth, -(batHeight/100*power));
    //draw powerlevel text
    fill(255);
    text((int)power, posX+(batWidth/4), posY+(batHeight-20));
  }

  public void reducePower() {
    //reduce power once with speed
    power-=speed;
    //prevent from going under 0
    if (power<=0) {
      power =0;
    }
  }

  public void raisePower() {
    //increase power once with speed
    power+=speed;
    //prevent from going over 100
    if (power>=100) {
      power =100;
    }
  }
}
  public void settings() {  size(520, 300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Lab_03_01_PowerBank" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
