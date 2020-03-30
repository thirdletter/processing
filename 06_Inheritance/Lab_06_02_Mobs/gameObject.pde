public class GameObject {
  private int x, health, maxHP, speed, score;
  protected int y; //protected makes it accessible to subclasses
  private PImage picture;

  //const
  public GameObject(int x, int y, PImage picture) {
    this.x = x;
    this.y = y;
    this.picture = picture;
  }

  //move
  public void move() {
    x -= speed; //assume x is positive, move from right to left
  }

  //move
  public void display() {
    tint(255, (float)health/maxHP * 255); //health/maxHP returns a number between 0 and 1, times 255 because range is 0,255
    imageMode(CORNER); // is default, only used to be explicit.
    image(picture, x, y);
  }

  //hit
  public void hit() {
    health-=1;
  }

  //hit detection
  public boolean hitDetection(GameObject other) {
    //only interested in horizontal hit detection. jumping over it still counts as hit
      if (this.getRight() < other.getLeft()){ //left of the other object
      return false;
    }
      if (this.getLeft() > other.getRight()){ //right of the other object
      return false;
    } else { // if neither condition is met, you have a hit horizontally
      return true;
    }
  }

  //getters and setters
  public int getLeft() {
    return x;
  }

  public int getRight() {
    return getLeft() + picture.width;
  }

  public int getTop() {
    return y;
  }

  public int getBottom() {
    return getTop() + picture.height;
  }

  public int getHealth() {
    return health;
  }

  public int getMaxHP() {
    return maxHP;
  }

  public int getSpeed() {
    return speed;
  }

  public int getScore() {
    return score;
  }


  //no setters for x and y
  // they will be updated using move method and initially set by const.
  //no setter for image as image never changes

  public void setHealth(int newHP) {
    health = newHP;
  }

  public void setMaxHP(int newMax) {
    maxHP = newMax;
  }

  public void setSpeed(int newSpeed) {
    speed = newSpeed;
  }

  public void setScore(int newScore) {
    score = newScore;
  }
}
