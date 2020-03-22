//initialize vars and objects
Bird twitter,vogel;
int var1;
float var2;

//setup runs once at start of program
void setup() {
  size(842, 480);
  //load objects with data if needed
  // args : String filename, int numFrames, float xPos, float yPos, int speed
  twitter = new Bird("twitter-bird-sprite.jpg",4,20,20,9);
  vogel = new Bird("sprite1.jpg",14,20,200,1);
}

//draw is executed every frame, 60fps by default
void draw() {
   background(255);
  twitter.display();
  vogel.display();
  twitter.update();
  vogel.update();
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the key variable
void keyPressed() {
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
}
