class DaeRectangle{
  
  float centerX, centerY, w, h;
  color clr;
  
  DaeRectangle(float centerX, float centerY, float w, float h, color clr){
    this.centerX = centerX;
    this.centerY = centerY;
    this.w = w;
    this.h = h;
    this.clr = clr;
  }
  
  void move(float dx, float dy){
    centerX += dx;
    centerY += dy;
  }
  
  void display(){
    noStroke();
    fill(clr);
    rectMode(CENTER);
    rect(centerX, centerY, w, h);
  }
}
