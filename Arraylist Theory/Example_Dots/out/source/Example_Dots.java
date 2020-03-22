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

public class Example_Dots extends PApplet {

//create an empty array for 100 Dot objects
int numDots=100;
ArrayList<Dot> dotsArr = new ArrayList<Dot>();

public void setup() {
    
    

    //and actually create the objects and populate the array with them
    for (int i = 0; i < numDots; i++){
        dotsArr.add(new Dot(new PVector(200,200),
                    new PVector(random(-10,10),
                    random(-10,10)),
                    5));
    }
}

public void draw() {

    background(0);

    //iterate trough every moving dot
    for (int i = 0; i < dotsArr.size(); i++){
        Dot dotObject = dotsArr.get(i);
        dotObject.update();
        dotObject.checkCollisions(width, height);
        dotObject.display();
    }
    
}
class Dot {
    private PVector position;
    private PVector speed;
    private float radius;

    //constructor
    Dot(PVector position, PVector speed, float radius){
        this.position = position;
        this.speed = speed;
        this.radius = radius;
    }

    public void update(){
        //ADD VECTORS WITH add method!
        position.add(speed);
    }

    public void checkCollisions(float maxWidth, float maxHeight){

        if ( (position.x < radius) || (position.x > maxWidth-radius)){
            speed.x = -speed.x;
        }

        if ( (position.y < radius) || (position.y > maxHeight-radius)){
            speed.y = -speed.y;
        }
    }

    public void display(){
        fill(255);
        ellipse(position.x, position.y, radius*2, radius*2);
    }
}
  public void settings() {  size(400, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Example_Dots" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
