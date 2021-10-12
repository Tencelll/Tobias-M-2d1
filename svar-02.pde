// Modifikation af Tobias M og Simon A.
// Github repository URL: https://github.com/Tencelll/Tobias-M-2d1
// firkanter.pde kan findes der, samt svar-02.pde (hvilket også kan ses her).

// Active PDE program version.
// 8-bit Binary to Unsigned integer number

Bit[] bits = new Bit[8];    // array with room for 8 on/off Bit instances
int decimal = 0;
int binary = 0;
PFont font;

void setup() {
  size(600, 300);
  noStroke();
  font = createFont("Arial", 48, true);    // Windows 10 have a wrong font path
  for (int i = 0; i < bits.length; i++) {
    bits[i] = new Bit(i);
  }  // for
}  // setup

void draw() {
  background(0);
  for (int i = 0; i < bits.length; i++) {
    bits[i].display();
    fill(255);
    int bitValue = 1 << (bits.length - i - 1);    // very fast calculation of 2^i
    text(bitValue, width/9 * bits[i].position - 10, 50);
  }  // for
  fill(255);
  textFont(font, 48);
  textAlign(RIGHT);
  text(nf(binary, 8), width/9*8, 180);
  text(decimal, width/9*8, 230);
  textAlign(LEFT);
  text("Binært:", width/9, 180);
  text("Decimalt:", width/9, 230);
  textFont(font, 18);
  fill(0, 255, 255);  // Cyan text
  text("Klik en bit for at tænde (og addere værdien 2^n) eller sluk for en bit.", width/22, 25);
}  // draw

void keyReleased() {
  decimal = 0;
  binary = 0;
  for (int i = 0; i < bits.length; i++) {
    bits[i].updateKey();
    decimal += bits[i].value;  
    binary += bits[i].digit;
  }  // for
}  // keyReleased

void mouseReleased() {
  decimal = 0;
  binary = 0;
  for (int i = 0; i < bits.length; i++) {
    bits[i].updateMouse();
    decimal += bits[i].value;  
    binary += bits[i].digit;
  }  // for
}  // mouseReleased

class Bit {             // Bit object class
  int position;
  color colour = (55);  // Grey
  int value = 0;
  int digit = 0;
  
  Bit(int pos) {
    position = pos + 1;
  }
  
  void display() {
    fill(colour);
    rect(width/9 * position-25, 80-25, 50, 50); // Vi ændrer funktionen fra ellipse til rect og subtraherer den halve størrelse af den nye firkant fra positionen (50/2 = 25) for at nulstille positionen af figuren, da det ønskede centrum ellers ville være oppe i venstre hjørne af figuren.
  }
  
  void updateKey() {
    if (key == position + 48) {
      switch(colour) {
        case (55):
          colour = (255);
          value = int (pow(2, 8 - position));
          digit = int (pow(10, 8 - position));
          break;
        case (255):
          colour = (55);
          value = 0;
          digit = 0;
          break;
      }  // switch
    }  // if      
  }  // updateKey
  
  void updateMouse() {
    if (onSquare(width/9 * position, 80, 50)) { // Ændrede navnet til onSquare.
      switch(colour) {
        case (55):
          colour = (255);
          value = int (pow(2, 8 - position));    // slow calculations
          digit = int (pow(10, 8 - position));   
          break;
        case (255):
          colour = (55);
          value = 0;
          digit = 0;
          break;
      }  // switch
    }  // onSquare ( // Ændrede navnet til onSquare.)
  }  // updateMouse
}  // class

boolean onSquare(int x, int y, int diameter) { // Ændrede navnet til onSquare.
  float distX = x - mouseX;
  float distY = y - mouseY;
  // Slettede variablen radius, da den ikke skulle bruges længere.
  if (sqrt(sq(distX)) <= 25 && sqrt(sq(distY)) <= 25) { // Ændret: Istedet, checker vi nu om X er inden for firkanten, og derefter om Y er inden for firkanten. Hvis sandt, ved vi at musen befinder sig inde i firkanten og kan returnere det.
    return true;
  } else {
    return false;
  }  // if
}  // end onCircle

// end
