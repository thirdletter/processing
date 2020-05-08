class Dave { //<>//
  private int numElements=3;
  private PImage[] arrImg;
  private int maxLives, curLives, score;
  private float friction;
  private PVector pos, accel, velocity;
  private boolean leftPressed, rightPressed, isJumping, hasCup;

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
    if ( accel.x < 0) {  //goes left
      image(arrImg[0], pos.x, pos.y);
    }
    if (accel.x == 0) {  //does not move horizontally 
      image(arrImg[1], pos.x, pos.y);
    }
    if (accel.x > 0) {  //goes right
      image(arrImg[2], pos.x, pos.y);
    }
  }

  void collision(Tile tile) {
    float distX = (this.pos.x + arrImg[0].width/2) - (tile.pos.x + world.getTileSize()/2);
    float distY = (this.pos.y + arrImg[0].height/2) - (tile.pos.y + world.getTileSize()/2);
    float combinedHalfWidths = arrImg[0].width/2 + world.getTileSize()/2;
    float combinedHalfHeights = arrImg[0].height/2 + world.getTileSize()/2;
    float overlapX = combinedHalfWidths - abs(distX);
    float overlapY = combinedHalfHeights - abs(distY);
    if (abs(distX) < combinedHalfWidths) {
      //collision on x, check to see if y collides
      if (abs(distY) < combinedHalfHeights) {
        //they are colliding
        if (tile instanceof Door && dave.getCupState()) {
          //end the level
          //find a way to load the next level
        }
        if (tile instanceof Cup) {
          tile.setTaken();
          dave.setCupState(true);
        }
        if (tile instanceof Dia || tile instanceof Gem) {
          //need to find a solution so each diamond only counts once and is replaced with emptytile as soon as we pick it up.
          this.addScore(tile.getPoints());
          tile.setTaken();
        }
        //wallCollision
        if (tile instanceof Solid || tile instanceof Pipe) {     
          //find how much they overlap on each axis
          //collision is happening on the axis with least amount of overlap
          if (overlapX >= overlapY) {
            if (distY > 0) {
              //top edge of player
              this.pos.y += overlapY;
              this.velocity.y = 0;
            } else if (distY < combinedHalfHeights) {
              //bottom edge of player
              this.pos.y -= overlapY;
              this.velocity.y = 0;
              isJumping = false;
            }
          } else if (overlapX < overlapY) {
            if (distX > 0) {
              //Left edge of player
              this.pos.x += overlapX;
              this.velocity.x = 0;
            } else if (distX < combinedHalfWidths) {
              //right edge of player
              this.pos.x -= overlapX;
              this.velocity.x = 0;
            }
          }
        }
      }
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
    } else if (!leftPressed && !rightPressed) { // no horizontal key pressed
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
    //if (velocity.y == 0) {
    //  isJumping = false;
    //}
    //add acceleration to respective velocity
    velocity.x += accel.x;
    velocity.y += accel.y;
    //add velocity to respective position
    pos.x += velocity.x;
    pos.y += velocity.y;
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
  void addScore(int newScore) {
    score += newScore;
  }
  boolean getCupState() {
    return hasCup;
  }
  void setCupState(boolean newState) {
    hasCup = newState;
  }
}
