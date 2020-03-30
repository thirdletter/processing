class DaeCircle extends DaeEllipse {

  DaeCircle(float centerX, float centerY, float diameter, color clr, boolean isFilled) {
    super(centerX, centerY, diameter, diameter, clr, isFilled);
  }

  void move(float dx, float dy) {
    super.move(dx, dy);
  }

  void display() {
    super.display();
  }
}
