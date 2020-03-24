class Shape{
  private PVector pos;
  private color clr;
  private int size = 20, round = 5;
  private float angle;

  //const
  Shape(PVector p, color c){
    this.pos = p;
    this.clr = c;
    //calculate a random angle to use
    angle = random(361);
  }

  //display
  void display(){
    fill(clr);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angle));
    rectMode(CENTER);
    rect(0, 0, size, size, round);
    popMatrix();
  }
}
