class Shape{
  PVector pos;
  color clr;

  //const
  Shape(PVector p, color c){
    this.pos = p;
    this.clr = c;
  }

  //display
  void display(){
    fill(clr);
    rect(pos.x, pos.y, 5, 5,3);
  }
}
