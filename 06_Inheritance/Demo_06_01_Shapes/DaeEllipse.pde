class DaeEllipse{
  
  float centerX, centerY, w, h;
  color clr;
  boolean isFilled = false;
  
  DaeEllipse(float centerX, float centerY, float w, float h, color clr, boolean isFilled){
    this.centerX = centerX;
    this.centerY = centerY;
    this.w = w;
    this.h = h;
    this.clr = clr;
    this.isFilled = isFilled;
  }
  
  void move(float dx, float dy){
    centerX += dx;
    centerY += dy;
  }
  
  void display(){
    if(isFilled){
      noStroke();
      fill(clr);
    }
    else{
      noFill();
      stroke(clr);
    }
    ellipseMode(CENTER);
    ellipse(centerX, centerY, w, h);
  }
}
