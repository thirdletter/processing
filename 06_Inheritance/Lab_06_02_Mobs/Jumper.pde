public class Jumper extends GameObject {

  //data members
  private float velocityY; //current vertical speed
  private float gravity = 10;
  private float time = 0.4; //frametime?
  private int groundY;

  //const
  public Jumper(int x, int y, PImage picture) {
    super(x, y, picture); //call const of GameObject
    setSpeed(5);
    setHealth(2);
    setMaxHP(2);
    setScore(2);
    velocityY = -random(50, 80);
    groundY = y;
  }

  private float DeltaVelocityY() {
    return time * gravity;
  }

  public void move() {
    super.move(); //!! this only moves horizontally !!

    //vertical movement calc
    velocityY += DeltaVelocityY();
    y =(int)(y + velocityY * time);
    if (y > groundY) { //if you are below groundlevel
      y = groundY;
      velocityY *= -1;
    }
  }
}
