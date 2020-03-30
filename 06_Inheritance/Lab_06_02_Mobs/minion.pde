public class Minion extends GameObject {

  //const
  public Minion(int x, int y, PImage picture) {
    super(x, y, picture); //call const of GameObject
    setSpeed(3);
    setHealth(2);
    setMaxHP(2);
    setScore(1);
  }
}
