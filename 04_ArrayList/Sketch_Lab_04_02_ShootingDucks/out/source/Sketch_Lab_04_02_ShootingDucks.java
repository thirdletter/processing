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

public class Sketch_Lab_04_02_ShootingDucks extends PApplet {

//initialize
PFont Agency;
PImage bg,duck,scoreboard;
int score,lives;
ArrayList <Duck> ducksArr = new ArrayList <Duck>();

public void setup() {
    
    //load data
    Agency = loadFont("AgencyFB-Bold-48.vlw");
    bg = loadImage("background.png");
    scoreboard = loadImage("scoreboard.png");
    duck = loadImage("duck.png");
    lives = 3;

    //temp first duck object added
    ducksArr.add(new Duck());
}

public void draw() {
    // background(0); // does not seem to work, figure out a way to make bg black
    background(bg);
    textFont(Agency);

    //display scoreboard, pos is given
    image(scoreboard, (width * 0.66f), (height - 180));
    text("Score:"+score, (width * 0.66f) +  25, (height - 120));
    text("Lives:"+lives, (width * 0.66f) + 25, (height - 70));

    for(int i = 0; i < ducksArr.size(); i++){
        ducksArr.get(i).move();
        ducksArr.get(i).display();
    }

}
class Duck{
private PImage duckImg;
private PVector pos;
private int speed;

    //const
    Duck(){
        this.duckImg = loadImage("duck.png");
        this.speed = 5;
        this.pos = new PVector(width + duckImg.width, 300); // start pos just outside right edge of screen
    }

    public void display(){
        image(duckImg, pos.x, pos.y);
    }

    public void move(){
        pos.x -= speed; 
    }
}
  public void settings() {  size(1020, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Lab_04_02_ShootingDucks" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
