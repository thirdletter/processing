public class Turret extends GameObject {
  private int remainingBullets;
  
  //const
  public Turret(int x, int y, PImage picture, int remainingBullets) {
    super(x, y, picture); //call const of GameObject
    setSpeed(0);
    setHealth(10);
    setMaxHP(10);
    setScore(1); //does not matter
    this.remainingBullets = remainingBullets;
  }
  
  public Bullet shoot(PImage bulletImg){
    if (remainingBullets > 0){
      remainingBullets--;
      Bullet bullet = new Bullet(this.getRight(), this.getTop(), bulletImg);
      return bullet;
    }
    return null; //return null object if no remainingbullets to prevent game crashing
  }
  
  //getters/setters
  public int getRemainingBullets(){
  return remainingBullets;
  }
  
  public void setRemainingBullets(int newBullets){
  remainingBullets = newBullets;
  }
}
