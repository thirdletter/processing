//initialize vars and objects
ArrayList <Cube> arrCube = new ArrayList <Cube>();
int numCubes = 5;

//setup runs once at start of program
void setup() {
  size(500, 500);
  //load objects with data if needed
  for (int i=0; i<numCubes; i++) {
    //arrCube[i]=new Cube(250, 250, 25+(50 * i));
    Cube cubeObject = new Cube(250, 250, 25+(50 * i));
    arrCube.add(cubeObject);
  }
}

//draw is executed every frame, 60fps by default
void draw() {
  background(255);
  for (int i=0; i < arrCube.size(); i++) {
    arrCube.get(i).calculate();
    arrCube.get(i).drawCube();
  }
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
void keyPressed() {
  if(key == 'a' || key =='A' ){
    arrCube.add(new Cube(250,250,50 * arrCube.size()));
  }
  if(key == '1'){
    arrCube.remove(1);
  }
   else if (key == '2'){
    arrCube.remove(2);
  }
  else if (key == '3'){
    arrCube.remove(3);
  }
  else if (key == '4'){
    arrCube.remove(4);
  }
  else if (key == '5'){
    arrCube.remove(5);
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
  if (mouseButton == LEFT) {
    for ( int i=0; i < arrCube.size(); i++) {
      arrCube.get(i).rotate();
    }
  }
}
