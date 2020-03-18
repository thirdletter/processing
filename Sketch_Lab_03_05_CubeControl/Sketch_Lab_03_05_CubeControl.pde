//initialize vars and objects
Class1 object1,object2;
int var1,var2;
float var2;

//setup runs once at start of program
void setup() {
  size(500, 500);
  //load objects with data if needed
  object1 = new Class1(5,10);
  object2 = new Class1(20,50);
}

//draw is executed every frame, 60fps by default
void draw() {
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the key variable
void keyPressed() {
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
}
