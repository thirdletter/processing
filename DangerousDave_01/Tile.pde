abstract class Tile{
  protected PVector pos;
  protected PImage tileImg;
  
  
  Tile(PVector pos, PImage tileImg){
    this.pos=pos;
    this.tileImg=tileImg;
  }
  
  void display(){
    imageMode(CORNER);
    image(tileImg,pos.x,pos.y);
    }
  
  
  
  
  
  
}
