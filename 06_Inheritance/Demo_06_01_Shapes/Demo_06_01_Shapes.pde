DaeRectangle[] rectangleArr = new DaeRectangle[2];
DaeRectLabel[] rectLabelArr = new DaeRectLabel[2];
DaeEllipse[] ellipseArr = new DaeEllipse[3];
DaeCircle[] circleArr = new DaeCircle[2];
float speed = 15, dx = 0, dy = 0;

void setup() {
  size(842, 480);
  ellipseArr[0] = new DaeEllipse(15, 20, 30, 40, color( 255, 255, 0 ), true );
  ellipseArr[1] = new DaeEllipse(30, 85, 60, 70, color( 255, 0, 255 ), true );
  ellipseArr[2] = new DaeEllipse(25, 165, 50, 70, color( 0, 255, 255 ), false );

  circleArr[0] = new DaeCircle(125, 25, 50, color( 255, 0, 0 ), true );
  circleArr[1] = new DaeCircle(140, 100, 80, color( 0, 255, 0 ), true );

  rectangleArr[0] = new DaeRectangle(225, 40, 50, 80, color( 0, 0, 255  ));
  rectangleArr[1] = new DaeRectangle(225, 110, 50, 40, color( 127, 0, 255 ));

  rectLabelArr[0] = new DaeRectLabel(350, 15, 100, 30, color( 200, 200, 200 ), "DAE" );
  rectLabelArr[1] = new DaeRectLabel(350, 55, 100, 30, color( 150, 150, 150 ), "The Best" );
  
}

void draw() {
  background(100);
  for (int i = 0; i < ellipseArr.length; i++){
    ellipseArr[i].display();
    ellipseArr[i].move(dx, dy);
  }
  for (int i = 0; i < circleArr.length; i++){
    circleArr[i].display();
    circleArr[i].move(dx, dy);
  }
  for (int i = 0; i < rectangleArr.length; i++){
    rectangleArr[i].display();
    rectangleArr[i].move(dx, dy);
  }
  for (int i = 0; i < rectLabelArr.length; i++){
    rectLabelArr[i].display();
    rectLabelArr[i].move(dx, dy);
  }
  dx=0;dy=0;
}

void keyPressed(){
  if (key == CODED){
    switch(keyCode){
      case UP: dx = 0; dy = -speed; break;
      case LEFT: dx = -speed; dy = 0; break;
      case RIGHT: dx = speed; dy = 0; break;
      case DOWN: dx = 0;  dy = speed; break;
    }
  }
}
