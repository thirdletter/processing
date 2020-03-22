//initialize vars, arrays and objects
int size=10, totalPower=0;
Battery[] arrBattery = new Battery[size];

//setup runs once at start of program
void setup() {
  size(520, 300);
  //load array with  data
  for (int i=0; i< arrBattery.length; i++) {
    arrBattery[i] = new Battery(20+(50*i), 20);
  }
}

//draw is executed every frame, 60fps by default
void draw() {
  background(0);
  for (int i=0; i< arrBattery.length; i++) {
    arrBattery[i].display();
  }
  //this executes once every second
  if (frameCount % 60 == 0) {
    for (int i=0; i< arrBattery.length; i++) {
      arrBattery[i].reducePower();
    }
  }
  //add up power values of every object
  for (int i=0; i< arrBattery.length; i++) {
    totalPower +=arrBattery[i].power;
  }
  //display total power
  text("Total power: "+totalPower, width/2-50, 250);
  //reset totalPower to 0, otherwise totalPower will be incorrect.
  totalPower=0;
}

//keyPressed is called once every time a key is pressed.
//The key that was pressed is stored in the keyCode variable
void keyPressed() {
  if (key == 'r' || key == 'R') {
    for (int i=0; i< arrBattery.length; i++) {
      arrBattery[i].raisePower();
    }
  }
}

//mousePressed is called once after every time a mouse button is pressed.
//The mouseButton variable can be used to determine which button has been pressed.
void mousePressed() {
  if (mouseButton == RIGHT) {
    //stops draw from executing
    noLoop();
  } else if (mouseButton == LEFT) {
    //restarts draw
    loop();
  }
}
