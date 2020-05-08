//initialize vars and objects
PImage emptyImg, daveImg, diaImg, cupImg, doorImg, pipeImg, solidImg, gemImg, redDiaImg;
Dave dave;
World world;

//setup runs once at start of program
void setup() {
  size(1140, 600);
  loadAssets();
}

//draw is executed every frame, 60fps by default
void draw() {
  //background(68,36,52);
  dave.physics();
  for (int i=0; i<world.numTilesH; i++) { // for each column
    for (int j=0; j<world.numTilesV; j++) { // for each tile in that column
      dave.collision(world.currentLevel[j][i]);
      if (world.currentLevel[j][i].getTaken()) { //check if the tile has been taken by the player
        //and change the current tile to an empty tile if that is the case
        world.currentLevel[j][i] = new Empty(new PVector(i*world.tileSize, j*world.tileSize), emptyImg);
      }
    }
  }
  world.display();
  dave.display();
  showHUD();
}


//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
void keyPressed() {
  if (keyCode==LEFT) {
    dave.pressLeft(true);
  }
  if (keyCode==RIGHT) {
    dave.pressRight(true);
  }
  if (keyCode==UP) {
    dave.jump();
  }
}

void keyReleased() {
  if (keyCode==LEFT) {
    dave.pressLeft(false);
  }
  if (keyCode==RIGHT) {
    dave.pressRight(false);
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
}

//load images
private void loadAssets() {
  //images
  emptyImg = loadImage("emptySprite.png");
  daveImg = loadImage("walkSprite.png");
  diaImg = loadImage("diaSprite.png");
  cupImg = loadImage("cupSprite.png");
  doorImg = loadImage("doorSprite.png");
  pipeImg = loadImage("pipeSprite.png");
  solidImg = loadImage("solidSprite.png");
  gemImg = loadImage("gemSprite.png");
  redDiaImg = loadImage("redDiaSprite.png");
  //objects
  dave = new Dave(daveImg);
  world = new World();
  world.loadlevel1();
}

void showHUD() {
  textSize(30);
  textAlign(LEFT);
  text("Score: "+dave.getScore(), 20, 35);
  textAlign(CENTER);
  text("Level: " + world.getLevel(), width/2, 35);
  if (dave.getCupState()) {
    text("!!! GO THROUGH THE DOOR !!!", width/2, 580);
  }
  textAlign(RIGHT);
  text("Daves: " + dave.getCurLives(), width-20, 35);
}
