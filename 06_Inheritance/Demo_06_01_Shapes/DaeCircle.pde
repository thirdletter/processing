class DaeCircle{
  
  float centerX, centerY, diameter;
  color clr;
  boolean isFilled = false;
    
  DaeCircle(float centerX, float centerY, float diameter, color clr, boolean isFilled){
    this.centerX = centerX;
    this.centerY = centerY;
    this.clr = clr;
    this.diameter = diameter;
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
    ellipse(centerX, centerY, diameter, diameter);
  }
}
