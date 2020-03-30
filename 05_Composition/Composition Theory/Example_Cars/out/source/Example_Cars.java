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

public class Example_Cars extends PApplet {

//DECLARATIE
int numCars=3;
Car[] carsArr = new Car[numCars];

public void setup(){
    
    background(255);

    initializecars();
}

public void draw(){
    background(255);

    for (int i = 0; i < carsArr.length; ++i) {
        carsArr[i].move(width);
        carsArr[i].display();
    }
}

public void initializecars(){
    for(int i=0; i < carsArr.length; i++){
        //x, y, w, color, speed
        float randWidth=random(100,200);
        float randHeight=random(50,80);
        PVector position=new PVector(random(randWidth, width-randWidth), random(randHeight,height-randHeight));
        int randColor = color(random(256), random(256), random(256));
        float speed=random(5,10);
        carsArr[i] = new Car(position, randWidth, randHeight, randColor, speed, 2);
    }
}

public void keyPressed(){
    if(key == 'r' || key == 'R'){
        for(int i=0; i < carsArr.length; i++){
            carsArr[i].setStatusCar(true);
        }
    }

    if(key == 's' || key == 'S'){
        for(int i=0; i < carsArr.length; i++){
            carsArr[i].setStatusCar(false);
        }
    }

    if(key == 'y' || key == 'Y'){
        for(int i=0; i < carsArr.length; i++){
            carsArr[i].setSpeed(15);
        }
    }
}
class Car{
    private PVector position;
    private float w, h, speed;
    private int colour;
    private boolean started;
    private Wheel[] wheels; //COMPOSITION

    //const
    Car(PVector position, float w, float h, int c, float speed, int NumWheels){
        this.position = position;
        this.w = w;
        this.h = h;
        this.speed = speed;
        this.colour = c;
        this.started = false;
        //create the array!
        this.wheels = new Wheel[NumWheels];

        //init the wheels-array!
        createWheels();
    }

    public void createWheels(){
        float xWheel=position.x - w/4;
        float yWheel=position.y + h/6;
        int wheelSize=(int)h/2;

        for(int i=0; i < wheels.length; i++){
            wheels[i] = new Wheel(xWheel, yWheel, wheelSize);
            xWheel+=w/2;
        }
    }

    //member method display
    public void display(){
        noStroke();
        fill(colour);
        rectMode(CENTER);
        rect(position.x, position.y, w, h/2);
        rect(position.x, position.y-h/2, +2, w/2, h/2);

        //windows
        fill(255, 150);
        rect(position.x-w/8, position.y-h/2 + 2, w/6, h/3);
        rect(position.x-w/8, position.y-h/2 + 2, w/6, h/3);

        //display wheels
        for(int i=0; i < wheels.length; i++){
            wheels[i].display();
        }
    }

    public void move(float limit){
        if(started){
            this.position.x += speed;

            if(position.x > limit){
                this.position.x = 0;
            }

            //move position of wheels also
            float xWheel=position.x-w/4;
            for(int i=0; i < wheels.length; i++){
                wheels[i].setPosition(xwheel + (i*(w/2)));
            }
        }
    }

    //setters
    public void setStatusCar(boolean state){
        this.started = state;
    }

    public void setSpeed(float sp){
        this.speed = sp;
    }

    //getters
    public boolean getStarted(){
        return started;
    }

    public void toggle(){
        this.started != started;
    }

//end of class
}
  public void settings() {  size(400, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Example_Cars" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
