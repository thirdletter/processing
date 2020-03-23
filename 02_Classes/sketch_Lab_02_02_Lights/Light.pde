// Initialize class & variables
class Light {
  private float xPos, yPos, radius;
  private color clr;
  private boolean isOn;
  //Constructor
  Light(float xPos, float yPos, float radius, color clr) {
    this.xPos=xPos;
    this.yPos=yPos;
    this.radius=radius;
    this.clr=clr;
  }

  //method that displays our light and changes colour based on boolean isOn
  void display() {
    fill(190, 190, 190);
    if (isOn==true) { 
      fill(clr);
    }
    ellipseMode(CORNER);
    ellipse(xPos, yPos, 2*radius, 2*radius);
  }

  //Collission test with light
  void hitTest(float mx, float my) {
    if (mx>=xPos&& mx<=xPos+2*radius&& my>=yPos && my<=yPos+2*radius) {
      isOn=!isOn;
    }
  }

  // returns 1 or 0 based on state on isOn
  int getIntegerValueOfIsOn() {
    if (isOn==true) {
      return 1;
    } else { 
      return 0;
    }
  }
}
