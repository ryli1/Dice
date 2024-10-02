void setup() {
  noLoop();
  rectMode(CENTER);
  size(600, 600);
}


void draw() {
  background(#3CC652);
  textAlign(CENTER);
  button();
  if (size == 1) {
    for (int y = 60; y <= 570; y += 60) { //9 rows
      for (int x = 60; x <= 570; x += 60) { //9 columns
        die dice1 = new die(x, y);
        dice1.show();
      }
    }
  } else if (size == 0.5) {
    for (int y = 30; y <= 570; y += 30) { //9 rows
      for (int x = 30; x <= 570; x += 30) { //9 columns
        die dice1 = new die(x, y);
        dice1.show();
      }
    }
  }
  fill(#000000);
  text("Total: " + sum, 500, 585);
}

void mousePressed() {
  sum = 0;
  redraw();
}

void button() { //Button that changes size of dice
  fill(#FF5858);
  rectMode(CENTER);
  rect(120, 582, 200, 20, 20);
  fill(#000000);
  text("Click Here To Change Size", 125, 586);
  if (mousePressed == true) {
    //ERROR ON HERE; WHERE IT CHECKS IF MOUSE IS ON BUTTON
    if (mouseX >= 20 && mouseX <= 220 && mouseY >= 80 && mouseY <= 590) {
      if (size == 0.5) {
        size = 1;
      } else if (size == 1) {
        size = 0.5;
      }
    }
  }
}
double size = 1;
int sum = 0;

class die {
  int diceX, diceY, diceRoll;
  die(int x, int y) {
    roll();
    diceX = x;
    diceY = y;
  }

  void show() {
    if (size == 1) { //Display large dice
      //Dice square
      fill(#FFFFFF);
      rect(diceX, diceY, 50, 50, 15);

      //Display number of dots based on roll
      fill(#000000);
      if (diceRoll == 1) {
        ellipse(diceX, diceY, 10, 10); //circle in middle
      }
      if (diceRoll == 2) {
        ellipse(diceX-10, diceY+10, 10, 10); //circle on bottom left
        ellipse(diceX+10, diceY-10, 10, 10); //circle on bottom right
      }
      if (diceRoll == 3) {
        ellipse(diceX-10, diceY+10, 10, 10); //circle on bottom left
        ellipse(diceX, diceY, 10, 10); //circle in middle
        ellipse(diceX+10, diceY-10, 10, 10); //circle on bottom right
      }
      if (diceRoll == 4) {
        ellipse(diceX-10, diceY-10, 10, 10); //circle on top left
        ellipse(diceX-10, diceY+10, 10, 10); //circle on bottom left
        ellipse(diceX+10, diceY-10, 10, 10); //circle on top right
        ellipse(diceX+10, diceY+10, 10, 10); //circle on bottom right
      }
      if (diceRoll == 5) {
        ellipse(diceX-10, diceY-10, 10, 10); //circle on top left
        ellipse(diceX-10, diceY+10, 10, 10); //circle on bottom left
        ellipse(diceX+10, diceY-10, 10, 10); //circle on top right
        ellipse(diceX+10, diceY+10, 10, 10); //circle on bottom right
        ellipse(diceX, diceY, 10, 10); //circle in middle
      }  
      if (diceRoll == 6) {
        ellipse(diceX-10, diceY-12, 10, 10); //circle on top left
        ellipse(diceX-10, diceY+12, 10, 10); //circle on bottom left
        ellipse(diceX+10, diceY-12, 10, 10); //circle on top right
        ellipse(diceX+10, diceY+12, 10, 10); //circle on bottom right
        ellipse(diceX-10, diceY, 10, 10); //circle in middle left
        ellipse(diceX+10, diceY, 10, 10); //circle in middle left
      }
    } else if (size == 0.5) { //Display Smaller Dice
      //Dice square
      fill(#FFFFFF);
      rect(diceX, diceY, 25, 25, 7.5);

      //Display number of dots based on roll
      fill(#000000);
      if (diceRoll == 1) {
        ellipse(diceX, diceY, 5, 5); //circle in middle
      }
      if (diceRoll == 2) {
        ellipse(diceX-5, diceY+5, 5, 5); //circle on bottom left
        ellipse(diceX+5, diceY-5, 5, 5); //circle on bottom right
      }
      if (diceRoll == 3) {
        ellipse(diceX-5, diceY+5, 5, 5); //circle on bottom left
        ellipse(diceX, diceY, 5, 5); //circle in middle
        ellipse(diceX+5, diceY-5, 5, 5); //circle on bottom right
      }
      if (diceRoll == 4) {
        ellipse(diceX-5, diceY-5, 5, 5); //circle on top left
        ellipse(diceX-5, diceY+5, 5, 5); //circle on bottom left
        ellipse(diceX+5, diceY-5, 5, 5); //circle on top right
        ellipse(diceX+5, diceY+5, 5, 5); //circle on bottom right
      }
      if (diceRoll == 5) {
        ellipse(diceX-5, diceY-5, 5, 5); //circle on top left
        ellipse(diceX-5, diceY+5, 5, 5); //circle on bottom left
        ellipse(diceX+5, diceY-5, 5, 5); //circle on top right
        ellipse(diceX+5, diceY+5, 5, 5); //circle on bottom right
        ellipse(diceX, diceY, 5, 5); //circle in middle
      }  
      if (diceRoll == 6) {
        ellipse(diceX-5, diceY-6, 5, 5); //circle on top left
        ellipse(diceX-5, diceY+6, 5, 5); //circle on bottom left
        ellipse(diceX+5, diceY-6, 5, 5); //circle on top right
        ellipse(diceX+5, diceY+6, 5, 5); //circle on bottom right
        ellipse(diceX-5, diceY, 5, 5); //circle in middle left
        ellipse(diceX+5, diceY, 5, 5); //circle in middle left
      }
    }
  }

  void roll() {
    diceRoll = (int)(Math.random()*6)+1;
    sum += diceRoll;
  }
}
