class DaeRectLabel{
  
  float centerX, centerY, w, h;
  color clr;
  String label;
  
  DaeRectLabel(float centerX, float centerY, float w, float h, color clr, String label){
    this.centerX = centerX;
    this.centerY = centerY;
    this.w = w;
    this.h = h;
    this.clr = clr;
    this.label = label;
  }
  
  void move(float dx, float dy){
    centerX += dx;
    centerY += dy;
  }
  
  void display(){
    int padding=5;
    
    noStroke();
    fill(clr);
    rectMode(CENTER);
    rect(centerX, centerY, w, h);
    fill(0);
    textSize(14);
    text(label, centerX - w/2 + padding, centerY + h/2 - padding);
  }
}
