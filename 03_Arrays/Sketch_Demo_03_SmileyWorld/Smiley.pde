class Smiley {
  //data members
  private float xPos, yPos, diameter, speed=random(60, 180), xDirection=random(3), yDirection=random(5);
  private int border=20;
  private PImage imgSmiley, imgSprite;
  private boolean isHighest=false, isSleeping=false;

  //constructor
  Smiley(float xPos, float yPos, PImage imgSmiley) {
    this.xPos=xPos;
    this.yPos=yPos;
    this.imgSmiley=imgSmiley;
  }
  /*adjust the position variables and make the smiley bouncing the borders. 
   You will notice that the smileys go very fast. Each frame the position changes,
   so multiply the position with 1/framerate, so he changes it only once in 1 second!*/
  void move() {
    xPos+=xDirection;
    yPos+=yDirection;
    if(xPos <= diameter/2 || xPos >= width-diameter/2){
    xDirection*=-1;
    }
    if(yPos <= diameter/2 || yPos >= height-diameter/2){
    yDirection*=-1;
    }
  }
  /*Draws the part of the bitmap according to its state:
   o If the smiley is at the highest position (isHighest is true), then the happy smiley is drawn.
   o If the smiley is near the screen boundaries (20 pixels border), the scared smiley is drawn.
   If the smiley is sleeping, the sleeping smiley is drawn
   o If none of the above conditions is met, the neutral smiley should be drawn.*/
  void display() {
    imageMode(CENTER);
    //happy smile
    if (isHighest==true) {
      imgSprite = imgSmiley.get(0, 0, int(diameter), int(diameter));
      image(imgSprite, xPos, yPos);
    }
         // sleeping smile
     else if (isSleeping==true) {
      imgSprite = imgSmiley.get(150, 0, int(diameter), int(diameter));
      image(imgSprite, xPos, yPos);
    }
      //scared smile
    else if ((xPos < ((diameter/2)+border) || xPos > width-((diameter/2)+border)) || (yPos < ((diameter/2)+border) || yPos > height-((diameter/2)+border))) {
      imgSprite = imgSmiley.get(100, 0, int(diameter), int(diameter));
      image(imgSprite, xPos, yPos);
    }
     // else if (yPos < 45 || yPos > height-45) {
     // imgSprite = imgSmiley.get(100, 0, int(diameter), int(diameter));
     // image(imgSprite, xPos, yPos);
     // }

    //neutral smile
    else {
      imgSprite = imgSmiley.get(50, 0, int(diameter), int(diameter));
      image(imgSprite, xPos, yPos);
    }
  }

  void increaseSpeed() {
    speed=speed*1.05;
  }
  void decreaseSpeed() {
    speed=speed/1.05;
  }
  //get from lights ex, change boolean isSleeping
   void hitTest(float mx, float my){
    if (mx>=xPos-(diameter/2)&& mx<=xPos+(diameter/2)&& my>=yPos-(diameter/2) && my<=yPos+(diameter/2)) {
      isSleeping=!isSleeping;
    }     
 }
  float getYPosition() {
    return yPos;
  }
  //this method sets the data member “isHighest” of the object for being the highest to true.
  void setHighest(Boolean highest) {
    isHighest = highest;
  }
}
