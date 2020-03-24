//initialize class and variables
class Cube {
  private int centerX, centerY, angle=0;
  private float vertSize, horiSize;
  private color clr;
  private float[] xPos = new float[4];
  private float[] yPos = new float[4];

  //Constructor
  Cube(int centerX, int centerY, int horiSize) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.horiSize = horiSize;
    vertSize=0.6*horiSize;
  }


  //calculate 4 points of the center rect
  void calculate() {
    for (int i=0; i<xPos.length; i++) {
      xPos[i]=cos( radians(angle + i * 90)) * horiSize;
      yPos[i]=sin( radians(angle + i * 90)) * vertSize;
    }
  }

  //example of method that returns something
  void drawCube() {
    //draw the black plane
    stroke(0);
    line(centerX+xPos[0], centerY+yPos[0], centerX+xPos[1], centerY+yPos[1]);
    line(centerX+xPos[1], centerY+yPos[1], centerX+xPos[2], centerY+yPos[2]);
    line(centerX+xPos[2], centerY+yPos[2], centerX+xPos[3], centerY+yPos[3]);
    line(centerX+xPos[3], centerY+yPos[3], centerX+xPos[0], centerY+yPos[0]);
    //draw the red plane
    stroke(255, 0, 0);
    line(centerX+xPos[0], centerY+yPos[0]-vertSize, centerX+xPos[1], centerY+yPos[1]-vertSize);
    line(centerX+xPos[1], centerY+yPos[1]-vertSize, centerX+xPos[2], centerY+yPos[2]-vertSize);
    line(centerX+xPos[2], centerY+yPos[2]-vertSize, centerX+xPos[3], centerY+yPos[3]-vertSize);
    line(centerX+xPos[3], centerY+yPos[3]-vertSize, centerX+xPos[0], centerY+yPos[0]-vertSize);
    //draw the green plane
    stroke(0, 255, 0);
    line(centerX+xPos[0], centerY+yPos[0]+vertSize, centerX+xPos[1], centerY+yPos[1]+vertSize);
    line(centerX+xPos[1], centerY+yPos[1]+vertSize, centerX+xPos[2], centerY+yPos[2]+vertSize);
    line(centerX+xPos[2], centerY+yPos[2]+vertSize, centerX+xPos[3], centerY+yPos[3]+vertSize);
    line(centerX+xPos[3], centerY+yPos[3]+vertSize, centerX+xPos[0], centerY+yPos[0]+vertSize);
    //draw vertical blue lines
    stroke(0, 0, 255);
    //connect red x,y values to green x,y values
    line(centerX+xPos[0], centerY+yPos[0]-vertSize, centerX+xPos[0], centerY+yPos[0]+vertSize);
    line(centerX+xPos[1], centerY+yPos[1]-vertSize, centerX+xPos[1], centerY+yPos[1]+vertSize);
    line(centerX+xPos[2], centerY+yPos[2]-vertSize, centerX+xPos[2], centerY+yPos[2]+vertSize);
    line(centerX+xPos[3], centerY+yPos[3]-vertSize, centerX+xPos[3], centerY+yPos[3]+vertSize);

    //draw center circle
    fill(255, 0, 0);
    ellipse(centerX, centerY, 10, 10);
  }

  void rotate() {
    angle+=10;
  }
}
