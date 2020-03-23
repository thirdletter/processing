Smiley[]smileArr=new Smiley[10];

PImage sourceImg;
void setup() {
  /*Create the smiley class array and assign 10 Smiley objects to the array, 
   filled with random values for the position and the image diameter passed as 
   arguments to the constructor.*/
  sourceImg = loadImage("Smileys.png");
  //Smiley(float xPos, float yPos, PImage imgSmiley)
  for (int i=0; i<smileArr.length; i++) {
    smileArr[i]=new Smiley(random(0, width), random(0, height), sourceImg);
    smileArr[i].diameter=50;
  }
  size(842, 480);
}
void draw() {
  background(255);
    /* 
   - Move each smiley by calling their move-method
   - set the highest smiley
   - display each smiley by calling their display-method with a correct image*/
  for (int i=0; i < smileArr.length; i++){
  smileArr[i].move();
  smileArr[i].display();
  for( int j=0;j < smileArr.length; j++){
    smileArr[j].setHighest(false);
  }
  getHighestSmiley().setHighest(true);
  
  //println(smileArr[i].speed);
  
  }
}

void keyPressed() {
  //- increase the speed of all smileys when the UP-key is pressed
  if (keyCode == UP){
  for (int i=0; i<smileArr.length; i++){
  smileArr[i].increaseSpeed();
  }
  }
  //- decrease the speed of all smileys when the DOWN-key is pressed
  if (keyCode == DOWN){
  for (int i=0; i<smileArr.length;i++){
  smileArr[i].decreaseSpeed();
  }
  }
}

void mousePressed() {
  //call the hitTest method passing the mouse position as arguments when the left mouse is pressed
  if (mouseButton == LEFT){
  for (int i=0; i<smileArr.length; i++){
  smileArr[i].hitTest(mouseX,mouseY);
  }
  }
}

Smiley getHighestSmiley(){
  
/*The awake smiley at the highest position should show the happy smiley.
 Make a function that determines which awake smiley is at the highest position 
 (use getYPosition()). 
 The one with the smallest y-value is situated at the highest position.
 Call this function in the draw and notify the resulting smiley (using setHighest)
 that it is at the highest position. Mind that the previous highest smileys are no 
 longer at the highest position, thus also change the data member isHighest for these
 ones (TIP: looping over the array and setting the data member to false, using the 
 setter-method).*/
   float minYValue=height;
   int minIndex = 0;
   for( int i = 0; i < smileArr.length;i++){
    if ((smileArr[i].getYPosition() < minYValue) && (smileArr[i].isSleeping==false)){
      minYValue = smileArr[i].getYPosition();
      minIndex = i;
    } 
   }
        print("min value is " + minYValue);
  println("and highest awake smiley is index number " + minIndex);
   return smileArr[minIndex];

 }
 
