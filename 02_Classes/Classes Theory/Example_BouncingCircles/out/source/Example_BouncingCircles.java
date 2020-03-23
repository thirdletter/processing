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

public class Example_BouncingCircles extends PApplet {

//declaration

Circle randomCircle, centerCircle, fixedCircle, cedricCircle;

public void setup() {
   
  initializeCircles();
}
public void initializeCircles(){
 //random red cirlce
 randomCircle = initNewCircle(random(width), random(height), 100, 0xffF51B1B, 6.28f,8);
 //centered green circle
 centerCircle = initNewCircle(width/2,height/2,80,0xff1BF527,2.75f,15);
 //fixed blue circle
 fixedCircle = initNewCircle(random(width),random(height), 50, 0xff1B98F5,0,0);
 cedricCircle = initNewCircle(random(width),random(height), 20, 0xff123123,45.80f,4);
}
public Circle initNewCircle(float x, float y, int diam, int col, float angle, int speed){
Circle tempCircle = new Circle(x, y, diam, col);
tempCircle.setAngle(angle);
tempCircle.setSpeed(speed);
return tempCircle;
} 

public void draw() {
  background(30);

  //use the objects methods
  randomCircle.move(width, height);
  randomCircle.display(); 

  cedricCircle.move(width, height);
  cedricCircle.display();

  centerCircle.move(width, height);
  centerCircle.display();

  fixedCircle.display();
  fill(255);
  text("The x position of the fixed circle is:"+ fixedCircle.getXPos(), 20, 20);
}
class Circle{
  private float xPos, yPos, angle;
  private int speed, diameter;
  private int clr;
  
  //constructor
  Circle(float xPos, float yPos, int diameter, int clr){
    this.xPos = xPos;
    this.yPos = yPos;
    this.clr = clr;
    this.diameter = diameter;
  }
  public void display(){
   noStroke();
   fill(clr);
   ellipse(xPos,yPos, diameter, diameter);
  }
  public void setAngle(float angle){
   this.angle=angle; 
  }
  public void setSpeed(int speed){
   this.speed = speed; 
  }
  public void move(float screenWidth, float screenHeight){
   xPos+=speed*cos(angle);
   if(xPos < diameter/2 || xPos > screenWidth - diameter/2){ speed *=-1;}
   
   yPos+=speed*sin(angle);
   if(yPos < diameter/2 || yPos > screenHeight - diameter/2){ speed *=-1;}  
  }
  public int getXPos(){
    return (int)xPos;
  }
  
}
  public void settings() {  size(842, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Example_BouncingCircles" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
