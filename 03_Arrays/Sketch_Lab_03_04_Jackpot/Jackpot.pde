//initialize class and variables
class Jackpot {
  private int xPos, yPos, numElements, credits;
  private PImage img, imgSprite;
  /*
  PROBLEM:still have to figure out how to fix out of bounds issue if numElements > 6. presumably append function related.
  can technically call imgArr[5] which crashes if you use imgIcons because numElements is smaller than arraysize.
  maybe find a way to only create array after numElements is known and dynamically link it outside of constructor?
  
  SOLUTION:You are allowed to initialize an array without declaring a size, create array in constructor so you can give correct # of elements.
 */
  PImage[] imgArr;
  int[] numbers = new int[3];

  //Constructor
  Jackpot(int xPos, int yPos, PImage img, int numElements) {
    //link vars
    this.xPos = xPos;
    this.yPos = yPos;
    this.numElements = numElements;
    this.img = img;
    imgArr = new PImage[numElements];
    //cut sourceimage into equal pieces, dependant on image width and numElements, then store them in array.
    for (int i = 0; i < numElements; ++i) {
      imgArr[i] = img.get(i * (img.width/numElements), 0, (img.width/numElements), img.height);
    }
  }

  void display() {
    //draw 3 images horizontally, image displayed is decided by data in numbers[].
    image(imgArr[numbers[0]], xPos, yPos);
    image(imgArr[numbers[1]], xPos+180, yPos);
    image(imgArr[numbers[2]], xPos+360, yPos);
  }

  void numGen() {
    //fill array with random numbers.
    for ( int i=0; i < numbers.length; i++) {
      numbers[i] = (int)random(0, numElements);
    }
  }
  int result() {
    /*
     Checks if images are the same and returns the right amount of credits accordingly.
     Scoring system is as follows:
     All 3 images = 100 credits
     2 images = 20 credits
     */
    credits = 0;
    if (numbers[0] == numbers[1] && numbers[1] == numbers[2]) { //checks if all images are the same
      credits = 100;
    } else if (numbers[0] == numbers[1] || numbers[1] == numbers[2]) { // checks if 2 images are the same
      credits = 20;
    }
    return credits;
  }
}
