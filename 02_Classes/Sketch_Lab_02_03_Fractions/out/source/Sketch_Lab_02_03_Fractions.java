import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Sketch_Lab_02_03_Fractions extends PApplet {

// initialiseer objecten en variabelen
Fraction one, two, three, four;
//setup, execute 1 maal aan start van ons programma
// vul objecten met data
public void setup() {
  
  one = new Fraction(1, 3);
  two = new Fraction(1, 4);
  three = new Fraction(3, 4);
  four = new Fraction(4, 10);
}
//execute elk frame
public void draw() {
  //zet achtergrond zodat dingen kunnen worden geüpdatetet
  background(200);
  // plaats onze rechthoeken/arc met de display method
  one.display(20, 30, 20, color(0, 255, 0));
  two.display(20, 60, 20, color(0, 255, 0));
  three.display(20, 90, 20, color(0, 255, 0));
  four.display(20, 120, 20, color(0, 255, 0));
  //zet tekstkleur op wit
  fill(0);
  //tel de fracties op met de getValue method, en plaats ze in een string op het scherm
  text("Sum of all fractions is: "+(one.getValue()+two.getValue()+three.getValue()+four.getValue()), 20, 180);
}
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
  public void display(float x, float y, float size, int fillColour) {
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
    arc(x+((size*denominator)+size), y+(0.5f*size), size, size, 0, radians(360*(PApplet.parseFloat(numerator)/PApplet.parseFloat(denominator))), PIE);
  }

  //returned de waarde van de fractie in een float. ints moeten eerst getypecast worden voor ze gedeeld worden.
  public float getValue() {
    return PApplet.parseFloat(numerator)/PApplet.parseFloat(denominator);
  }
}
  public void settings() {  size(300, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sketch_Lab_02_03_Fractions" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
