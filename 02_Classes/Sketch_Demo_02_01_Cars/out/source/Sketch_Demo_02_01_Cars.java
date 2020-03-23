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

public class Sketch_Demo_02_01_Cars extends PApplet {

Car red, green, yellow;

public void setup() {

  
  yellow = new Car(width/2, height/3*1 - 50, 100, 50, color(255, 204, 0), random(5, 10));
  green = new Car(width/2, height/3*2 - 50, 200, 50, color(55, 204, 100), random(5, 10));
  red= new Car(width/2, height/3*3 - 50, 120, 80, color(255, 55, 50), random(5, 10));
}
public void draw() {
  background(255);
  yellow.display();
  yellow.move(width);
  green.display();
  green.move(width);
  red.display();
  red.move(width);
    if(yellow.getStatus()==true){
    println("is moving");
  }else{println("has stopped");}
}
public void keyPressed() {
  if (key=='r'||key=='R') {
    yellow.setStatus(true);
    green.setStatus(true);
    red.setStatus(true);
  }
  if (key=='s'||key=='S') {
    yellow.setStatus(false);
    green.setStatus(false);
    red.setStatus(false);
  }
  if (key=='y'||key=='y') {
    yellow.setSpeed(15);
  }
}
public void mousePressed() {
  if (mouseButton==LEFT) {
    yellow.toggle();
  }
  if (mouseButton==RIGHT){
    green.toggle();
  }
}
class Car {
  private float xPos, yPos, w, h, speed;
  private int clr;
  private boolean started;

  //const
  Car(float xPos, float yPos, float w, float h, int c, float speed) {
    this.xPos=xPos;
    this.yPos=yPos;
    this.w=w;
    this.h=h;
    this.clr=c;
    this.speed=speed;
  }
  public void display() {
    noStroke();
    fill(clr);
    rectMode(CENTER);

    //bottom of the car 
    rect(xPos, yPos, w, h/2);
    //top part
    rect(xPos, yPos-h/2+2, w/2, h/2);
    //windows
    fill(255, 150);
    rect(xPos-w/8, yPos-h/2+2, w/6, h/3);
    rect(xPos+w/8, yPos-h/2+2, w/6, h/3);
    //wheels
    fill(0);
    ellipse(xPos-w/4, yPos+h/6, h/2, h/2);
    ellipse(xPos+w/4, yPos+h/6, h/2, h/2);
    fill(255);
    ellipse(xPos-w/4, yPos+h/6, h/4, h/4);
    ellipse(xPos+w/4, yPos+h/6, h/4, h/4);
  }
  public void move(float limit) {
    if (started==true) {
      xPos+=speed;
      if (xPos>=limit) {
        xPos=0;
      }
    }
  }

  public void setSpeed(float speed) {
    this.speed = speed;
  }
  public void setStatus(boolean started) {
    this.started =started;
  }
  public void toggle() {
    started=!started;
  }
    public boolean getStatus(){
   return started; 
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Demo_02_01_Cars" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
