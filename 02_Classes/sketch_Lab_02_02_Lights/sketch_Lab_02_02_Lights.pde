// initialize Objects and variables
Light one, two, three, four;
int lightsOn;

// setup, fill our objects with data
void setup() {
  size(500, 100);
  one=new Light(20, 20, 15, color(255, 255, 20));
  two=new Light(60, 20, 15, color(255, 255, 20));
  three=new Light(100, 20, 15, color(255, 255, 20));
  four=new Light(140, 20, 15, color(255, 255, 20));
}

//executes every frame
void draw() {
  //set bg to text can be updated
  background(200);
  //display all our objects
  one.display();
  two.display();
  three.display();
  four.display();
  //add together all lights that are on use getIntegerValueOfIsOn()
  lightsOn = one.getIntegerValueOfIsOn()+two.getIntegerValueOfIsOn()+three.getIntegerValueOfIsOn()+four.getIntegerValueOfIsOn();
  //set text clr to white
  fill(255);
  //text that says current lights that are on
  text("Total number of lights that are on: "+lightsOn, 20, 60);
}
//executes on press of mousebutton
void mousePressed() {
  // tests if mouse is on object using hitTest method of object
  one.hitTest(mouseX, mouseY); 
  two.hitTest(mouseX, mouseY);
  three.hitTest(mouseX, mouseY);
  four.hitTest(mouseX, mouseY);
}
