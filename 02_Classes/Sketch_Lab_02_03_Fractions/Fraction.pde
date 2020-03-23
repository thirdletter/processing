//initialiseert class
class Fraction {
  //datamembers
  private int numerator, denominator;
  //CONSTRUCTOR FOR FRACTIONS 
  Fraction(int numerator, int denominator) {
    this.numerator=numerator;
    this.denominator=denominator;
  }
  //method display dat rechthoeken en arc weergeeft op basis van meegegeven argumenten
  void display(float x, float y, float size, color fillColour) {
    stroke(255);

    // itereert numerator aantal keren, schuift x positie van rechthoek met +size per keer
    //zet kleur op fillColour
    for (int i=0; i < numerator; i++) {
      fill(fillColour);
      rect(x+(i*size), y, size, size);
    }
    // itereert denominator aantal keren, schijft x positie van rechthoek met size per keer
    // zet fill uit waardoor gekleurde rechthoeken niet overschreven worden.
    for (int i=0; i < denominator; i++) {
      noFill();
      rect(x+(i*size), y, size, size);
    }
    //maakt een arc, beginnent op xpos x + aantal vierkanten + size, en ypos y+1/2size, van 0 graden tot 360*fractie graden
    fill(fillColour);
    arc(x+((size*denominator)+size), y+(0.5*size), size, size, 0, radians(360*(float(numerator)/float(denominator))), PIE);
  }

  //returned de waarde van de fractie in een float. ints moeten eerst getypecast worden voor ze gedeeld worden.
  float getValue() {
    return float(numerator)/float(denominator);
  }
}
