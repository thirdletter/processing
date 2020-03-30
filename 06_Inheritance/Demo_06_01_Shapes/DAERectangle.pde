class DaeRectangle extends DaeShape {

  DaeRectangle(float centerX, float centerY, float w, float h, color clr) {
    super(centerX, centerY, w, h, clr);
  }

  void move(float dx, float dy) {
    super.move(dx, dy);
  }

  void display() {
    noStroke();
    fill(clr);
    rectMode(CENTER);
    rect(centerX, centerY, w, h);
  }
}
