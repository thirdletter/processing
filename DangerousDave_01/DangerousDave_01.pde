//initialize vars and objects
PImage daveImg, diaImg, cupImg, doorImg, pipeImg, solidImg, gemImg, redDiaImg;
Dave dave;
World world1;

//setup runs once at start of program
void setup() {
  size(1140, 600);
   loadAssets();
}

//draw is executed every frame, 60fps by default
void draw() {
  background(68,36,52);
  world1.display();
  dave.display();
  dave.physics(); 
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
void keyPressed() {
  if (keyCode==LEFT){
   dave.pressLeft(true); 
  }
  if (keyCode==RIGHT){
   dave.pressRight(true); 
  }
  if (keyCode==UP){
   dave.jump(); 
  }
}

void keyReleased(){
    if (keyCode==LEFT){
   dave.pressLeft(false); 
  }
  if (keyCode==RIGHT){
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
  world1 = new World(diaImg, cupImg, doorImg, pipeImg, solidImg, gemImg, redDiaImg);
  world1.loadlevel1();
}
