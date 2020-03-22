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

public class Example_Balls extends PApplet {

ArrayList<Ball> balls = new ArrayList<Ball>();
final float gravityValue =0.1f, radius=10;

public void setup() {
    

    // Initialize a first ball at index 0
    Ball ballObject=new Ball(new PVector(50,0), radius, color(random(256), random(256), random(256)));
    balls.add(ballObject);
}

public void draw() {
    background(255);

    for (int i = 0; i < balls.size(); ++i) {

        Ball ballObject = balls.get(i);
        ballObject.gravity(gravityValue);
        ballObject.move();
        ballObject.bounce(height);
        ballObject.display();       
    }
}

public void mousePressed(){
    // create a new object at the mouse position
    Ball ballObject = new Ball(new PVector(mouseX,mouseY), radius, color(random(256), random(256), random(256)));
    balls.add(ballObject);
}

public void keyPressed(){
    if(key == 'd' || key == 'D'){
        balls.remove(balls.size()-1);
    }
}
class Ball{
    private PVector position;
    private float speed, radius;
    private int clr;

    //base constructor
    Ball(PVector position, float radius, int clr){
        this.position = position;
        this.radius = radius;
        this.clr = clr;
        this.speed = 5;
    }
    //overloading constructor
    Ball(PVector position, float radius, int clr, float speed){
        this(position, radius, clr);
        this.speed = speed;
    }

    public void gravity(float gy){
        //add gravity to speed
        this.speed = speed + gy;
    }

    public void move(){
        // Add speed to y location (has to fall down!)
        position.y += speed;
    }

    public void bounce(float screenHeight){
        // If square reaches the bottom, reverse speed
        if (position.y+radius > screenHeight){
            speed = speed * -1;
            position.y = screenHeight-radius;
        }
        if (position.y < radius){
            speed = speed * -1;
            position.y = radius;
        }
    }

    public void display(){
        fill(clr);
        ellipse(position.x, position.y, radius*2, radius*2);
    }
}
  public void settings() {  size(480,270); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Example_Balls" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
