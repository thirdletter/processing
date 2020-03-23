// initialiseer objecten en variabelen
Fraction one, two, three, four;
//setup, execute 1 maal aan start van ons programma
// vul objecten met data
void setup() {
  size(300, 200);
  one = new Fraction(1, 3);
  two = new Fraction(1, 4);
  three = new Fraction(3, 4);
  four = new Fraction(4, 10);
}
//execute elk frame
void draw() {
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
