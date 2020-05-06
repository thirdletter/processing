class Dave { //<>//
  private int numElements=3;
  private PImage[] arrImg;
  private int maxLives, curLives, score;
  private float friction;
  private PVector pos, accel, velocity;
  private boolean leftPressed, rightPressed, isJumping;

  public Dave(PImage daveImg) {
    pos = new PVector();
    accel = new PVector();
    velocity = new PVector();
    this.maxLives = 3;
    this.curLives = maxLives;
    this.friction = 1;
    //set arraysize to number of images
    arrImg = new PImage[numElements];
    //cut source image into equally wide pieces, and store them in arrImg
    for (int i=0; i<numElements; i++) {
      arrImg[i]=daveImg.get((daveImg.width/numElements)*i, 0, daveImg.width/numElements, daveImg.height);
    }
  }

  void display() {
    if ( velocity.x < 0) {  //goes left
      image(arrImg[0], pos.x, pos.y);
    }
    if (velocity.x == 0) {  //does not move horizontal 
      image(arrImg[1], pos.x, pos.y);
    }
    if (velocity.x > 0) {  //goes right
      image(arrImg[2], pos.x, pos.y);
    }
  }
  public void physics() {
    //reset acceleration !! NOT EQUALS TO VELOCITY !!
    //to prevent exponential increases in velocity
   accel.x = 0;
    //Check if player currently is pressing left or right, and increase/decrease accel accordingly
    if (leftPressed) {
      accel.x -= 0.1;
      friction = 1; //no friction
    } else if (rightPressed) {
      accel.x += 0.1;
      friction = 1; //no friction
    } else if(!leftPressed && !rightPressed) { // no horizontal key pressed
      accel.x -= 0; // dont change accel
      friction = 0.96; // add friction
    }
    //acceleration in y direction is gravity and constant, friction is calculated
    accel.y = 0.32; //gravity
    velocity.x *= friction; // calculate friction
    if (velocity.x <= 0.09 && velocity.x >= -0.09) { //added this to make him stop completely, because friction goes infinitely close to 0 but never exactly 0
      velocity.x = 0;
    }
    //check if player is jumping
    if (velocity.y == 0) {
      isJumping = false;
    }
    //add acceleration to respective velocity
    velocity.x += accel.x;
    velocity.y += accel.y;
    //add velocity to respective position
    pos.x += velocity.x;
    pos.y += velocity.y;
    //prevent player from falling through the ground
    if (pos.y > height-60-arrImg[0].height) {      
      pos.y = height-60-arrImg[0].height;
      velocity.y = 0;
    }
    //prevent player from exiting our screen horizontally
    if (pos.x < 60) {
      velocity.x = 0;
      pos.x = 60;
    }
    if (pos.x > width-60-arrImg[0].width) {
      velocity.x = 0;
      pos.x = width-60-arrImg[0].width;
    }
  }
  public void pressLeft(boolean bool) {
    leftPressed = bool;
  }
  public void pressRight(boolean bool) {
    rightPressed = bool;
  }
  public void jump() {
    if (isJumping == false) {
      isJumping = true;
      velocity.y = -10;
    }
  }
  int getCurLives() {
    return curLives;
  }
  int getScore() {
    return score;
  }
}
