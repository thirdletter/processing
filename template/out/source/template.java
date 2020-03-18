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

public class template extends PApplet {

//initialize vars and objects
Class1 object1,object2;
int var1;
float var2;

//setup runs once at start of program
public void setup() {
  
  //load objects with data if needed
  object1 = new Class1(5,10);
  object2 = new Class1(20,50);
}

//draw is executed every frame, 60fps by default
public void draw() {
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the key variable
public void keyPressed() {
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
public void mousePressed() {
}
//initialize class and variables
class Class1 {
  private int var1,var2;
  
  //Constructor
  Class1(int dataMember1, int dataMember2){
  this.var1 = dataMember1;
  this.var2 = dataMember2;
  }
}

//example void method
public void method1(){

}

//example of method that returns something
public int method2(){
 var1+=var2;
 return var1;
}

//getter
public int getVar1(){
  return var1;
}

//setter
public void setVar1(int set1){
var1=set1;
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "template" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
