//initialize class and variables
class Battery {
  private float posX, posY, batWidth, batHeight, power;
  private float speed;

  //Constructor
  Battery(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    batHeight = 200;
    batWidth = batHeight/5;
    power = 100;
    speed = random(1, 6);
  }

  void display() {
    noFill();
    stroke(255);
    rectMode(CORNER);
    //draw main rectangle
    rect(posX, posY, batWidth, batHeight);
    //draw battery top
    rect(posX+(batWidth/3), posY-(10), batWidth/3, 10);
    //color is greenish when power > 50
    if (power > 50) {
      fill(0, 120, 120);
      //color is blue when power between 50 and 26
    } else if (power <= 50 && power > 26) {
      fill(0, 0, 255);
      //color is red when power between 25 and 0
    } else if (power <= 25) {
      fill(255, 0, 0);
    }
    //draw power rectangle
    rect(posX, posY+batHeight, batWidth, -(batHeight/100*power));
    //draw powerlevel text
    fill(255);
    text((int)power, posX+(batWidth/4), posY+(batHeight-20));
  }

  void reducePower() {
    //reduce power once with speed
    power-=speed;
    //prevent from going under 0
    if (power<=0) {
      power =0;
    }
  }

  void raisePower() {
    //increase power once with speed
    power+=speed;
    //prevent from going over 100
    if (power>=100) {
      power =100;
    }
  }
}
