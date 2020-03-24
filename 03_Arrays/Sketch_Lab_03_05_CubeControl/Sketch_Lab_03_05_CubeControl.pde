//initialize vars and objects
Cube arrCube[]= new Cube[5];

//setup runs once at start of program
void setup() {
  size(500, 500);
  //load objects with data if needed
  for (int i=0; i<arrCube.length; i++) {
    arrCube[i]=new Cube(250, 250, 25+(50 * i));
  }
}

//draw is executed every frame, 60fps by default
void draw() {
  background(255);
  for (int i=0; i < arrCube.length; i++) {
    arrCube[i].calculate();
    arrCube[i].drawCube();
  }
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
void keyPressed() {
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
  if (mouseButton == LEFT) {
    for ( int i=0; i < arrCube.length; i++) {
      arrCube[i].rotate();
    }
  }
}
