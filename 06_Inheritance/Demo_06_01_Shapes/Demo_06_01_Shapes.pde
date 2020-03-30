DaeShape[] shapeArr = new DaeShape[9];
float speed = 15, dx = 0, dy = 0;

void setup() {
  size(842, 480);
  shapeArr[0] = new DaeEllipse(15, 20, 30, 40, color( 255, 255, 0 ), true );
  shapeArr[1] = new DaeEllipse(30, 85, 60, 70, color( 255, 0, 255 ), true );
  shapeArr[2] = new DaeEllipse(25, 165, 50, 70, color( 0, 255, 255 ), false );

  shapeArr[3] = new DaeCircle(125, 25, 50, color( 255, 0, 0 ), true );
  shapeArr[4] = new DaeCircle(140, 100, 80, color( 0, 255, 0 ), true );

  shapeArr[5] = new DaeRectangle(225, 40, 50, 80, color( 0, 0, 255  ));
  shapeArr[6] = new DaeRectangle(225, 110, 50, 40, color( 127, 0, 255 ));

  shapeArr[7] = new DaeRectLabel(350, 15, 100, 30, color( 200, 200, 200 ), "DAE" );
  shapeArr[8] = new DaeRectLabel(350, 55, 100, 30, color( 150, 150, 150 ), "The Best" );
}

void draw() {
  background(100);
  for (int i = 0; i < shapeArr.length; i++) {
    shapeArr[i].display();
    shapeArr[i].move(dx, dy);
  }
  dx=0;
  dy=0;
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case UP: 
      dx = 0; 
      dy = -speed; 
      break;
    case LEFT: 
      dx = -speed; 
      dy = 0; 
      break;
    case RIGHT: 
      dx = speed; 
      dy = 0; 
      break;
    case DOWN: 
      dx = 0;  
      dy = speed; 
      break;
    }
  }
}
