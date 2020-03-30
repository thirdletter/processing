public class GameObject {
  private int x, y, health, maxHP, speed, score;
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
    tint(255, (float)health/maxHP * 255); //health/maxHP returns a number between 0 and 1
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
    if (this.getRight() < other.getLeft()) { //if object is to the left of the other left side of image, aka completely to the left, no hit.
      return false;
    }
    if (this.getLeft() < other.getRight()) { //if leftside of object is to the right of right side of other object, no hit.
      return false;
    }
    return true; //because we ignore Y-axis, all other cases are true.
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
