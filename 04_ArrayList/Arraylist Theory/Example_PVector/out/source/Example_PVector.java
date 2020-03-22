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

public class Example_PVector extends PApplet {

ArrayList <PVector> coords;
int atlDots=15;

public void setup() {
    
    noStroke();
    fill(0);
    //fill array with vector points
    coords = new ArrayList();
    for (int i=0; i<atlDots; i++){
        PVector p = new PVector(random(width), random(height));
        coords.add(p);
    }
}

public void draw() {
    
    background(200);

    for (int i=0; i < coords.size(); i++){
        //moving the dots per 1 pixel
        PVector pos = coords.get(i);
        pos.x = (pos.x + random(-1,1));
        pos.y = (pos.y + random(-1,1));

        ellipse(pos.x, pos.y, 5, 5);
    }
}
  public void settings() {  size (300,300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Example_PVector" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
