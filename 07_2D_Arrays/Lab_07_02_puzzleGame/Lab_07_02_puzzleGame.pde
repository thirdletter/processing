PImage puzzleImg;
Puzzle puzzleObject;
int dimension = 3;


void setup() {
  size(400, 400); // I know it should be 500 x 500, but cannot figure out how to make the tiles scale.
  //load data
  puzzleImg = loadImage("numbers.jpg");
  puzzleObject = new Puzzle(dimension, puzzleImg);
  puzzleObject.initialize();
}

void draw() {
  background(200);
  puzzleObject.drawPuzzle();
}

void mousePressed() {
  puzzleObject.move(puzzleObject.getRowNumber(mouseY), puzzleObject.getColNumber(mouseX));
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    puzzleObject.resetPuzzle();
  }
}
