class Shape{
  private PVector pos;
  private color clr;
  private int size = 20, round = 5;

  //const
  Shape(PVector p, color c){
    this.pos = p;
    this.clr = c;
  }

  //display
  void display(){
    fill(clr);
    rect(pos.x, pos.y, size, size, round);
  }
}
