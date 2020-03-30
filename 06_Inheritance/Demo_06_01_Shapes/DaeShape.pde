abstract class DaeShape {

  float centerX, centerY, w, h;
  color clr;

  //constructor
  DaeShape(float centerX, float centerY, float w, float h, color clr) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.w = w;
    this.h = h;
    this.clr = clr;
  }

  //move
  void move(float dx, float dy) {
    centerX += dx;
    centerY += dy;
  }
  
  //display
  abstract void display();
}
