class Tile {
  private PImage picture;
  private int orderNumber;

  //const
  Tile(PImage picture, int orderNumber) {
    this.picture = picture;
    this.orderNumber = orderNumber;
  }

  //getter
  int getOrderNumber() {
    return orderNumber;
  }

  //display
  void display(int xPos, int yPos) {
    image(picture, xPos, yPos);
  }
}
