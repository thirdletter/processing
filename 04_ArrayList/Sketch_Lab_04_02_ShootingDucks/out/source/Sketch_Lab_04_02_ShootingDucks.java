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
int score,lives,hit;
boolean gameState = true;
ArrayList <Duck> ducksArr = new ArrayList <Duck>();

public void setup() {
    
    //load data
    Agency = loadFont("AgencyFB-Bold-48.vlw");
    bg = loadImage("background.png");
    scoreboard = loadImage("scoreboard.png");
    duck = loadImage("duck.png");
    lives = 3;
    background(0);

    //temp first duck object added
    ducksArr.add(new Duck());
}

public void draw() {
    background(bg);
    
    textFont(Agency);

    //display scoreboard, pos is given
    image(scoreboard, (width * 0.66f), (height - 180));
    text("Score:"+score, (width * 0.66f) +  25, (height - 120));
    text("Lives:"+lives, (width * 0.66f) + 25, (height - 70));

    //display all ducks and move them
    for(int i = 0; i < ducksArr.size(); i++){
        ducksArr.get(i).move();
        ducksArr.get(i).display();
    }

    //add a new duck every second
    if (frameCount % 60 == 0){
        ducksArr.add(new Duck());
    }

    //check if game has ended
    if (gameState == false){
        noLoop();
    }
}

public void mousePressed(){
    // init local vars
    int currentLives = lives;

        for(int j = ducksArr.size() - 1; j >= 0; j--){
            //added local vars to make hittest more readable
            float xPos = ducksArr.get(j).pos.x;
            float yPos = ducksArr.get(j).pos.y;
            float duckWidth = ducksArr.get(j).duckImg.width;
            float duckHeight = ducksArr.get(j).duckImg.height;
            //check if you hit the duck
                if(mouseX >= xPos && mouseX <= (xPos + duckWidth) && mouseY >= yPos && mouseY <= (yPos + duckHeight)){
                ducksArr.remove(j);
                score++;
                hit = 1;
            }
        }
    if(hit != 1){
            lives--;
        }
    if(lives <= 0){
        gameState = false;
    }    
    hit = 0; // reset hit var you doofus
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
        if (pos.x < -duckImg.width){ // reset pos.x if image is past screen completely.
            pos.x = width + duckImg.width;
        } else
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
