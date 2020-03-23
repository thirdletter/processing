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

public class sketch_Lab_02_02_Lights extends PApplet {

// initialize Objects and variables
Light one, two, three, four;
int lightsOn;

// setup, fill our objects with data
public void setup() {
  
  one=new Light(20, 20, 15, color(255, 255, 20));
  two=new Light(60, 20, 15, color(255, 255, 20));
  three=new Light(100, 20, 15, color(255, 255, 20));
  four=new Light(140, 20, 15, color(255, 255, 20));
}

//executes every frame
public void draw() {
  //set bg to text can be updated
  background(200);
  //display all our objects
  one.display();
  two.display();
  three.display();
  four.display();
  //add together all lights that are on use getIntegerValueOfIsOn()
  lightsOn = one.getIntegerValueOfIsOn()+two.getIntegerValueOfIsOn()+three.getIntegerValueOfIsOn()+four.getIntegerValueOfIsOn();
  //set text clr to white
  fill(255);
  //text that says current lights that are on
  text("Total number of lights that are on: "+lightsOn, 20, 60);
}
//executes on press of mousebutton
public void mousePressed() {
  // tests if mouse is on object using hitTest method of object
  one.hitTest(mouseX, mouseY); 
  two.hitTest(mouseX, mouseY);
  three.hitTest(mouseX, mouseY);
  four.hitTest(mouseX, mouseY);
}
// Initialize class & variables
class Light {
  private float xPos, yPos, radius;
  private int clr;
  private boolean isOn;
  //Constructor
  Light(float xPos, float yPos, float radius, int clr) {
    this.xPos=xPos;
    this.yPos=yPos;
    this.radius=radius;
    this.clr=clr;
  }

  //method that displays our light and changes colour based on boolean isOn
  public void display() {
    fill(190, 190, 190);
    if (isOn==true) { 
      fill(clr);
    }
    ellipseMode(CORNER);
    ellipse(xPos, yPos, 2*radius, 2*radius);
  }

  //Collission test with light
  public void hitTest(float mx, float my) {
    if (mx>=xPos&& mx<=xPos+2*radius&& my>=yPos && my<=yPos+2*radius) {
      isOn=!isOn;
    }
  }

  // returns 1 or 0 based on state on isOn
  public int getIntegerValueOfIsOn() {
    if (isOn==true) {
      return 1;
    } else { 
      return 0;
    }
  }
}
  public void settings() {  size(500, 100); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_Lab_02_02_Lights" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
