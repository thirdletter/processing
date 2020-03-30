class DaeEllipse extends DaeShape {

  boolean isFilled = false;

  DaeEllipse(float centerX, float centerY, float w, float h, color clr, boolean isFilled) {
    super(centerX, centerY, w, h, clr);
    this.isFilled = isFilled;
  }

  void move(float dx, float dy) {
    super.move(dx, dy);
  }

  void display() {
    if (isFilled) {
      noStroke();
      fill(clr);
    } else {
      noFill();
      stroke(clr);
    }
    ellipseMode(CENTER);
    ellipse(centerX, centerY, w, h);
  }
}
