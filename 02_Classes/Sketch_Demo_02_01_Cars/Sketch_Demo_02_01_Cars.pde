Car red, green, yellow;

void setup() {

  size(500, 500);
  yellow = new Car(width/2, height/3*1 - 50, 100, 50, color(255, 204, 0), random(5, 10));
  green = new Car(width/2, height/3*2 - 50, 200, 50, color(55, 204, 100), random(5, 10));
  red= new Car(width/2, height/3*3 - 50, 120, 80, color(255, 55, 50), random(5, 10));
}
void draw() {
  background(255);
  yellow.display();
  yellow.move(width);
  green.display();
  green.move(width);
  red.display();
  red.move(width);
    if(yellow.getStatus()==true){
    println("is moving");
  }else{println("has stopped");}
}
void keyPressed() {
  if (key=='r'||key=='R') {
    yellow.setStatus(true);
    green.setStatus(true);
    red.setStatus(true);
  }
  if (key=='s'||key=='S') {
    yellow.setStatus(false);
    green.setStatus(false);
    red.setStatus(false);
  }
  if (key=='y'||key=='y') {
    yellow.setSpeed(15);
  }
}
void mousePressed() {
  if (mouseButton==LEFT) {
    yellow.toggle();
  }
  if (mouseButton==RIGHT){
    green.toggle();
  }
}
