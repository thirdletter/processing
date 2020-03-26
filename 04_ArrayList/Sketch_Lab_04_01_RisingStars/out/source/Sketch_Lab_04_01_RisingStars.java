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

public class Sketch_Lab_04_01_RisingStars extends PApplet {

ArrayList <Star> stArr = new ArrayList <Star>();

public void setup() {
  
}

public void draw() {
  background(0);
  for (int i=0; i < stArr.size(); i++) {
    stArr.get(i).display();
  }
}

public void mousePressed() {
  stArr.add(new Star(new PVector(mouseX, mouseY)));
}
class Star {
  private PVector pos;
  private int numLines, rad;
  private float offset;
  private int[] clrArr;

  //const
  Star(PVector p) {
    this.pos = p; // centerpoint of drawing
    this.offset = (int)random(361); // random offset angle for first line
    this.numLines = 6; // amount of lines
    this.rad = 50; // size of each line/radius of the imaginary circle
    this.clrArr = new int[numLines]; // set array length to number of lines, then fill array with random colors
    for (int i=0; i < clrArr.length; i++) {
      clrArr[i] = color(random(256), random(256), random(256));
    }
  }

  //display
  public void display() {
    strokeWeight(2); // to make lines a bit more visible
    for (int j = 0; j < numLines; j++) {
      stroke(clrArr[j]); //set color of line to corresponding color
      float angle  =  radians(360.0f/numLines*j); // angle increases with 360/numLines each iteration
      float x2 = pos.x  + rad * cos(angle+offset); //take cosine of angle + offset to generate right xpos
      float y2 = pos.y + rad * sin(angle+offset); //take sine of angle + offset to generate right ypos
      line(pos.x, pos.y, x2, y2);
    }
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Lab_04_01_RisingStars" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
