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

public class Sketch_Demo_04_02_Dots extends PApplet {

//initialize vars and objects
ArrayList <Shape> shapeArr = new ArrayList <Shape>(300);

//setup runs once at start of program
public void setup() {
  
  //load objects with data if needed
}

//draw is executed every frame, 60fps by default
public void draw() {
  background(30);
  for (int i=0; i < shapeArr.size(); i++) {
    shapeArr.get(i).display();
  }
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
public void keyPressed() {
  if(key == ' '){ //either this or use KeyCode == '32' as that is the matching keycode. found this by using println(keyCode)
    for(int i = shapeArr.size() - 1; i >= 0; i--){
      shapeArr.remove(i);
    }
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
public void mousePressed() {
  shapeArr.add(new Shape(new PVector(mouseX, mouseY), color(random(256), random(256), random(256))));
}
class Shape{
  private PVector pos;
  private int clr;
  private int size = 20, round = 5;

  //const
  Shape(PVector p, int c){
    this.pos = p;
    this.clr = c;
  }

  //display
  public void display(){
    fill(clr);
    rect(pos.x, pos.y, size, size, round);
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Demo_04_02_Dots" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
