ArrayList <Star> stArr = new ArrayList <Star>();

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  for (int i=0; i < stArr.size(); i++) {
    stArr.get(i).display();
  }
}

void mousePressed() {
  stArr.add(new Star(new PVector(mouseX, mouseY)));
}
