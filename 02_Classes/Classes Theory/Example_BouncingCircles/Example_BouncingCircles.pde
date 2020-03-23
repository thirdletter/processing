//declaration

Circle randomCircle, centerCircle, fixedCircle, cedricCircle;

void setup() {
  size(842, 480); 
  initializeCircles();
}
void initializeCircles(){
 //random red cirlce
 randomCircle = initNewCircle(random(width), random(height), 100, #F51B1B, 6.28,8);
 //centered green circle
 centerCircle = initNewCircle(width/2,height/2,80,#1BF527,2.75,15);
 //fixed blue circle
 fixedCircle = initNewCircle(random(width),random(height), 50, #1B98F5,0,0);
 cedricCircle = initNewCircle(random(width),random(height), 20, #123123,45.80,4);
}
Circle initNewCircle(float x, float y, int diam, color col, float angle, int speed){
Circle tempCircle = new Circle(x, y, diam, col);
tempCircle.setAngle(angle);
tempCircle.setSpeed(speed);
return tempCircle;
} 

void draw() {
  background(30);

  //use the objects methods
  randomCircle.move(width, height);
  randomCircle.display(); 

  cedricCircle.move(width, height);
  cedricCircle.display();

  centerCircle.move(width, height);
  centerCircle.display();

  fixedCircle.display();
  fill(255);
  text("The x position of the fixed circle is:"+ fixedCircle.getXPos(), 20, 20);
}
