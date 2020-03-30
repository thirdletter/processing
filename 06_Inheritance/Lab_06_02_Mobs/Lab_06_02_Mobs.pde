PImage bgImg, minionImg;
Minion minion;
int groundHeight = 126;

void setup() {
  size(1024, 512);
  loadImages();
  minion = createMinion();
}

//dont forget to add the 6 images to the sketch!!
private void loadImages() {
  bgImg = loadImage("bg.png");
  minionImg = loadImage("minion.png");
}

void draw() {
  background(bgImg);
  
  minion.display();
  minion.move();
}


public Minion createMinion() {
  return new Minion(width, height - groundHeight - minionImg.height, minionImg);
}
