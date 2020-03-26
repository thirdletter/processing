class Star {
  private PVector pos;
  private int numLines, rad;
  private float offset;
  private color[] clrArr;

  //const
  Star(PVector p) {
    this.pos = p; // centerpoint of drawing
    this.offset = (int)random(361); // random offset angle for first line
    this.numLines = 6; // amount of lines
    this.rad = 50; // size of each line/radius of the imaginary circle
    this.clrArr = new color[numLines]; // set array length to number of lines, then fill array with random colors
    for (int i=0; i < clrArr.length; i++) {
      clrArr[i] = color(random(256), random(256), random(256));
    }
  }

  //display
  void display() {
    strokeWeight(2); // to make lines a bit more visible
    for (int j = 0; j < numLines; j++) {
      stroke(clrArr[j]); //set color of line to corresponding color
      float angle  =  radians(360.0/numLines*j); // angle increases with 360/numLines each iteration
      float x2 = pos.x  + rad * cos(angle+offset); //take cosine of angle + offset to generate right xpos
      float y2 = pos.y + rad * sin(angle+offset); //take sine of angle + offset to generate right ypos
      line(pos.x, pos.y, x2, y2);
    }
  }
}
