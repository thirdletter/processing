class Car {
  private float xPos, yPos, w, h, speed;
  private color clr;
  private boolean started;

  //const
  Car(float xPos, float yPos, float w, float h, color c, float speed) {
    this.xPos=xPos;
    this.yPos=yPos;
    this.w=w;
    this.h=h;
    this.clr=c;
    this.speed=speed;
  }
  void display() {
    noStroke();
    fill(clr);
    rectMode(CENTER);

    //bottom of the car 
    rect(xPos, yPos, w, h/2);
    //top part
    rect(xPos, yPos-h/2+2, w/2, h/2);
    //windows
    fill(255, 150);
    rect(xPos-w/8, yPos-h/2+2, w/6, h/3);
    rect(xPos+w/8, yPos-h/2+2, w/6, h/3);
    //wheels
    fill(0);
    ellipse(xPos-w/4, yPos+h/6, h/2, h/2);
    ellipse(xPos+w/4, yPos+h/6, h/2, h/2);
    fill(255);
    ellipse(xPos-w/4, yPos+h/6, h/4, h/4);
    ellipse(xPos+w/4, yPos+h/6, h/4, h/4);
  }
  void move(float limit) {
    if (started==true) {
      xPos+=speed;
      if (xPos>=limit) {
        xPos=0;
      }
    }
  }

  void setSpeed(float speed) {
    this.speed = speed;
  }
  void setStatus(boolean started) {
    this.started =started;
  }
  void toggle() {
    started=!started;
  }
    boolean getStatus(){
   return started; 
  }
}
