public class Boss extends GameObject {

  //const
  public Boss(int x, int y, PImage picture) {
    super(x, y, picture); //call const of GameObject
    setSpeed(2);
    setHealth(10);
    setMaxHP(10);
    setScore(10);
  }
}
