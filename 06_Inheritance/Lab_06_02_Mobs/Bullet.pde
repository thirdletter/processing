public class Bullet extends GameObject {

  //const
  public Bullet(int x, int y, PImage picture) {
    super(x, y, picture); //call const of GameObject
    setSpeed(-10); // moves it to the right instead of left
    setHealth(1);
    setMaxHP(1);
    setScore(1);
  }
}
