//initialize vars and objects
ArrayList <Shape> shapeArr = new ArrayList <Shape>(300);

//setup runs once at start of program
void setup() {
  size(500, 500);
  //load objects with data if needed
}

//draw is executed every frame, 60fps by default
void draw() {
  background(30);
  for (int i=0; i < shapeArr.size(); i++) {
    shapeArr.get(i).display();
  }
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
void keyPressed() {
  if(key == ' '){ //either this or use KeyCode == '32' as that is the matching keycode. found this by using println(keyCode)
    for(int i = shapeArr.size() - 1; i >= 0; i--){
      shapeArr.remove(i);
    }
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
  shapeArr.add(new Shape(new PVector(mouseX, mouseY), color(random(256), random(256), random(256))));
}
