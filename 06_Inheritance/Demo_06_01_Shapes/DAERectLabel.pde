class DaeRectLabel extends DaeRectangle{

  String label;

  DaeRectLabel(float centerX, float centerY, float w, float h, color clr, String label) {
    super(centerX, centerY, w, h, clr);
    this.label = label;
  }

  void move(float dx, float dy) {
    super.move(dx, dy);
  }

  void display() {
    super.display();
    int padding=5;
    fill(0);
    textSize(14);
    text(label, centerX - w/2 + padding, centerY + h/2 - padding);
  }
}
