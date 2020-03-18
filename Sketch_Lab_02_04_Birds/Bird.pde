//initialize class and variables
class Bird {
  private float xPos, yPos, frameTime = 1/8.0, totalTime;
  private int speed, numFrames, frameCounter, frameWidth, frameHeight;
  private PImage imgSprite,imgSrc;

  //constructor
  Bird(String filename, int numFrames, float xPos, float yPos, int speed) {
    this.numFrames = numFrames;
    this.xPos = xPos;
    this.yPos = yPos;
    this.speed = speed;
    imgSrc = loadImage(filename);
  }

  //display
  void display() {
    //dynamically adjusts the width and height of imgSprite based on arguments provided when bird/object is created
    frameWidth = imgSrc.width / numFrames;
    frameHeight = imgSrc.height;
    //get grabs part of the original image and stores it into imgSprite
    imgSprite = imgSrc.get(frameCounter * frameWidth, 0, frameWidth, frameHeight);
    image(imgSprite, xPos, yPos);
  }

//updates the framecounter and xpos to show the right image
void update(){
 totalTime+=1/60.0;
 if (totalTime>frameTime){
 frameCounter++;
 totalTime=0;
 }
 frameCounter%=numFrames;
 xPos+=speed;
 if (xPos>=width){
 xPos=0;
 }
}
  //example of method that returns something
  int method2() {https://i.imgur.com/EsYF5aU.png
    var1+=var2;
    return var1;
  }

  //getter
  int getVar1() {
    return var1;
  }

  //setter
  void setVar1(int set1) {
    var1=set1;
  }
}
