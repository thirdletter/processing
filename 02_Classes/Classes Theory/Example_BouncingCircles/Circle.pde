class Circle{
  private float xPos, yPos, angle;
  private int speed, diameter;
  private color clr;
  
  //constructor
  Circle(float xPos, float yPos, int diameter, color clr){
    this.xPos = xPos;
    this.yPos = yPos;
    this.clr = clr;
    this.diameter = diameter;
  }
  void display(){
   noStroke();
   fill(clr);
   ellipse(xPos,yPos, diameter, diameter);
  }
  void setAngle(float angle){
   this.angle=angle; 
  }
  void setSpeed(int speed){
   this.speed = speed; 
  }
  void move(float screenWidth, float screenHeight){
   xPos+=speed*cos(angle);
   if(xPos < diameter/2 || xPos > screenWidth - diameter/2){ speed *=-1;}
   
   yPos+=speed*sin(angle);
   if(yPos < diameter/2 || yPos > screenHeight - diameter/2){ speed *=-1;}  
  }
  int getXPos(){
    return (int)xPos;
  }
  
}
