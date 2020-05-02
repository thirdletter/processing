class Dave { //<>//
  private int numElements=3;
  private PImage[] arrImg;
  private int MaxHP, curHP;
  private PVector pos, accel, velocity;
  private boolean leftPressed, rightPressed, isJumping;

  public Dave(PImage daveImg) {
    pos = new PVector();
    accel = new PVector();
    velocity = new PVector();
    //set arraysize to number of images
    arrImg = new PImage[numElements];
    //cut source image into equally wide pieces, and store them in arrImg
    for (int i=0; i<numElements; i++) {
      arrImg[i]=daveImg.get((daveImg.width/numElements)*i, 0, daveImg.width/numElements, daveImg.height);
    }
  }

  void display() {
    if ( velocity.x < 0) {
      image(arrImg[0], pos.x, pos.y);
    }
    if (velocity.x == 0) {
      image(arrImg[1], pos.x, pos.y);
    }
    if (velocity.x > 0) {
      image(arrImg[2], pos.x, pos.y);
    }
  }
  public void physics() {
    //reset acceleration !! NOT EQUALS TO VELOCITY !!
    accel.x = 0;
    //Check if player currently is pressing left or right, and increase/decrease accel accordingly
    if (leftPressed) {
      accel.x -= 0.1;
    } else {
      accel.x -= 0;
    }    
    if (rightPressed) {
      accel.x += 0.1;
    } else {
      accel.x -= 0;
    }
    //acceleration in y direction is gravity and constant
    accel.y = 0.32;
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
    //prevent player from falling trough the ground
    if (pos.y > height-60-arrImg[0].height) {      
      pos.y = height-60-arrImg[0].height;
      velocity.y = 0;
    }
    //prevent player from exiting our screen horizontally
    if (pos.x < 60) {
      velocity.x = 0;
      pos.x = 60;
    }
    if (pos.x > width-60-arrImg[0].height) {
      velocity.x = 0;
      pos.x = width-60-arrImg[0].height;
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
}
