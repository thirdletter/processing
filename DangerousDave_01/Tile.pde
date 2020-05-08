abstract class Tile {
  protected PVector pos;
  protected PImage tileImg;
  protected int points;
  protected boolean isTaken;


  Tile(PVector pos, PImage tileImg) {
    this.pos=pos;
    this.tileImg=tileImg;
  }

  void display() {
    imageMode(CORNER);
    image(tileImg, pos.x, pos.y);
  }
  //getters and setters
  float getTop() {
    return pos.y;
  }
  float getBottom() {
    return pos.y+tileImg.height;
  }
  float getLeft() {
    return pos.x;
  }
  float getRight() {
    return pos.x+tileImg.width;
  }
  void setTop(float newTop) {
    pos.y = newTop;
  }
  void setBottom(float newBottom) {
    pos.y = newBottom;
  }
  void setLeft(float newLeft) {
    pos.y = newLeft;
  }
  void setRight(float newRight) {
    pos.y = newRight;
  }
  int getPoints() {
    return points;
  }
  void setPoints(int newPoints) {
    points = newPoints;
  }

  void setTaken() {
    isTaken = true;
  }

  public boolean getTaken() {
    return isTaken;
  }
}
