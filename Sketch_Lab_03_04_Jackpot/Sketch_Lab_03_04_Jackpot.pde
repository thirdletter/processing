//initialize vars and objects
PFont BelinSans;
PImage imgCandy, imgFruits, imgIcons;
long timer; // datatpye long is an integer, but with a much larger range. (64bit int vs 32bit int)
int score, wait = 2000; // how long the game has to be live in milliseconds
boolean gameStarted, gameEnded;
Jackpot row1, row2, row3;
//setup runs once at start of program
void setup() {
  size(600, 750);
  //load fonts and images into corresponding vars
  BelinSans = loadFont("BerlinSansFBDemi-Bold-100.vlw");
  imgCandy = loadImage("candy.jpg");
  imgFruits = loadImage("fruits.jpg");
  imgIcons = loadImage("icons.jpg");
  //fill objects with data
  //Jackpot(int xPos, int yPos, PImage img, int numElements)
  row1 = new Jackpot(50, 120, imgIcons, 5);
  row2 = new Jackpot(50, 290, imgFruits, 6);
  row3 = new Jackpot(50, 480, imgCandy, 6);
  //generate random numbers once to start sketch randomized
  row1.numGen();
  row2.numGen();
  row3.numGen();
}

//draw is executed every frame, 60fps by default
void draw() {
  background(0);
  //set font stuff
  fill(211, 0, 184);
  textFont(BelinSans, 60);
  textAlign(CENTER);
  text("JACKPOT", 300, 75);
  //display 3 sets of images
  row1.display();
  row2.display();
  row3.display();
  //display start button if game is not live
  if (gameStarted == false) {
    fill(211, 0, 184);
    rect(200, 650, 200, 50);
    fill(0);
    textFont(BelinSans, 32);
    text("START", 300, 685);
  }
  //generate random numbers if game is live
  if (gameStarted == true) {
    if (millis() < (timer+wait)) { //millis() is amount of millisecond since sketch started., this if statement runs for 2sec then stops.
      row1.numGen();
      row2.numGen();
      row3.numGen();
    } else { // making sure to reset gameStarted value after we stop generating numbers, and tell program game has ended.
      gameStarted = false;
      gameEnded = true;
    }
  }
  if (gameEnded == true) {
    score = row1.result()+row2.result()+row3.result(); //add up score from all 3 rows
    //fill screen with semi transparant rect
    fill(0, 185);
    rect(0, 0, width, height);
    //write resulting score to screen
    fill(255, 255);
    textFont(BelinSans, 26);
    text("You won "+score+" credits!", 300, 375);
    text("Play again (Press the r-key)!", 300, 425);
  }
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the key variable
void keyPressed() {
  if (key == 'r' || key == 'R') {
    gameEnded=false;
    score=0;
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
  if (mouseButton == LEFT) {
    //set timer to amount of milliseconds since sketch started, only when game is ready to be started.
    if (gameStarted == false && gameEnded == false) {
      timer = millis();
      gameStarted = true;
    }
  }
}
