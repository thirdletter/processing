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

public class Sketch_Demo_04_01_CubeControl extends PApplet {

//initialize vars and objects
ArrayList <Cube> arrCube = new ArrayList <Cube>();
int numCubes = 5;

//setup runs once at start of program
public void setup() {
  
  //load objects with data if needed
  for (int i=0; i<numCubes; i++) {
    //arrCube[i]=new Cube(250, 250, 25+(50 * i));
    Cube cubeObject = new Cube(250, 250, 25+(50 * i));
    arrCube.add(cubeObject);
  }
}

//draw is executed every frame, 60fps by default
public void draw() {
  background(255);
  for (int i=0; i < arrCube.size(); i++) {
    arrCube.get(i).calculate();
    arrCube.get(i).drawCube();
  }
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
public void keyPressed() {
  if(key == 'a' || key =='A' ){
    arrCube.add(new Cube(250,250,50 * arrCube.size()));
  }
  if(key == '1'){
    arrCube.remove(1);
  }
   else if (key == '2'){
    arrCube.remove(2);
  }
  else if (key == '3'){
    arrCube.remove(3);
  }
  else if (key == '4'){
    arrCube.remove(4);
  }
  else if (key == '5'){
    arrCube.remove(5);
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
public void mousePressed() {
  if (mouseButton == LEFT) {
    for ( int i=0; i < arrCube.size(); i++) {
      arrCube.get(i).rotate();
    }
  }
}
//initialize class and variables
class Cube {
  private int centerX, centerY, angle=0;
  private float vertSize, horiSize;
  private int clr;
  private float[] xPos = new float[4];
  private float[] yPos = new float[4];

  //Constructor
  Cube(int centerX, int centerY, int horiSize) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.horiSize = horiSize;
    vertSize=0.6f*horiSize;
  }


  //calculate 4 points of the center rect
  public void calculate() {
    for (int i=0; i<xPos.length; i++) {
      xPos[i]=cos( radians(angle + i * 90)) * horiSize;
      yPos[i]=sin( radians(angle + i * 90)) * vertSize;
    }
  }

  //example of method that returns something
  public void drawCube() {
    //draw the black plane
    stroke(0);
    line(centerX+xPos[0], centerY+yPos[0], centerX+xPos[1], centerY+yPos[1]);
    line(centerX+xPos[1], centerY+yPos[1], centerX+xPos[2], centerY+yPos[2]);
    line(centerX+xPos[2], centerY+yPos[2], centerX+xPos[3], centerY+yPos[3]);
    line(centerX+xPos[3], centerY+yPos[3], centerX+xPos[0], centerY+yPos[0]);
    //draw the red plane
    stroke(255, 0, 0);
    line(centerX+xPos[0], centerY+yPos[0]-vertSize, centerX+xPos[1], centerY+yPos[1]-vertSize);
    line(centerX+xPos[1], centerY+yPos[1]-vertSize, centerX+xPos[2], centerY+yPos[2]-vertSize);
    line(centerX+xPos[2], centerY+yPos[2]-vertSize, centerX+xPos[3], centerY+yPos[3]-vertSize);
    line(centerX+xPos[3], centerY+yPos[3]-vertSize, centerX+xPos[0], centerY+yPos[0]-vertSize);
    //draw the green plane
    stroke(0, 255, 0);
    line(centerX+xPos[0], centerY+yPos[0]+vertSize, centerX+xPos[1], centerY+yPos[1]+vertSize);
    line(centerX+xPos[1], centerY+yPos[1]+vertSize, centerX+xPos[2], centerY+yPos[2]+vertSize);
    line(centerX+xPos[2], centerY+yPos[2]+vertSize, centerX+xPos[3], centerY+yPos[3]+vertSize);
    line(centerX+xPos[3], centerY+yPos[3]+vertSize, centerX+xPos[0], centerY+yPos[0]+vertSize);
    //draw vertical blue lines
    stroke(0, 0, 255);
    //connect red x,y values to green x,y values
    line(centerX+xPos[0], centerY+yPos[0]-vertSize, centerX+xPos[0], centerY+yPos[0]+vertSize);
    line(centerX+xPos[1], centerY+yPos[1]-vertSize, centerX+xPos[1], centerY+yPos[1]+vertSize);
    line(centerX+xPos[2], centerY+yPos[2]-vertSize, centerX+xPos[2], centerY+yPos[2]+vertSize);
    line(centerX+xPos[3], centerY+yPos[3]-vertSize, centerX+xPos[3], centerY+yPos[3]+vertSize);

    //draw center circle
    fill(255, 0, 0);
    ellipse(centerX, centerY, 10, 10);
  }

  public void rotate() {
    angle+=10;
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Demo_04_01_CubeControl" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
