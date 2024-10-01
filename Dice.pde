/*void setup()
 {
 size(500, 300);
 textAlign(CENTER, CENTER);
 noLoop();
 }
 
 void draw() {
 Coin coin1 = new Coin(250, 250);
 coin1.show();
 coin1.flip();
 }
 
 void mousePressed()
 {
 redraw();
 }
 class Coin
 {
 //three member variables
 boolean heads; 
 int myX, myY;
 
 //three member functions
 Coin(int x, int y) { //constructor
 flip();
 myX = x;
 myY = y;
 }
 void flip()
 {
 if (Math.random() < 0.5)
 heads = true;
 else {
 heads = false;
 }
 }
 void show()
 {
 noStroke();
 fill(255);
 ellipse(myX, myY, 50, 50);
 fill(0);
 if (heads == true) {
 text("heads", myX, myY);
 } else {
 text("tails", myX, myY);
 }
 }
 } */



void setup() {
  noLoop();
  rectMode(CENTER);
  size(600, 600);
}

void draw(){
 die dice1 = new die(50, 50);
 dice1.show(); 
}

void mousePressed() {
  redraw();
}

class die {
  int diceX, diceY, diceRoll;
  die(int x, int y) {
    roll();
    diceX = x;
    diceY = y;
  }

  void show() {
    fill(#FFFFFF);
    rect(diceX, diceY, 50, 50, 20);
    
    fill(#000000);
    if (diceRoll == 1){
      ellipse(diceX, diceY, 10, 10);
    }
    if (diceRoll == 2){
      
    }
  }

  void roll() {
    diceRoll = (int)(Math.random()*6)+1;
    System.out.println(diceRoll);
  }
}
