//Click on a certain dice to reroll it and update the sum
//Remove System.out.println(), replace size with siz
//Instead of array, use a large integer. Each digit of the integer correlates to a dice.

void setup() {
  //noLoop();
  rectMode(CENTER);
  size(600, 600);
  background(#3CC652);
  reroll();
  frameRate(100);
}

int [] storedDiceX = new int[81];
int [] storedDiceY = new int[81];
int [] storedDiceRolls = new int[81];

void draw() {
  pushMatrix();
  rectMode(CORNER);
  fill(#3CC652);
  noStroke();
  rect(0, 570, 600, 60);
  popMatrix();
  strokeWeight(2);
  textAlign(CENTER);
  button();
  fill(#000000);
  text("Total: " + sum, 500, 585);
}

void mousePressed() {
  //sum = 0;
  redraw();
  diceClickedCheck(mouseX, mouseY);
}

void diceClickedCheck(int x, int y) {
  for (int i = 0; i < 81; i++) { //Checks if a mouse click is within the boundaries of a dice
    if ((x < storedDiceX[i]+25) && (x > storedDiceX[i]-25)) { 
      if ((y < storedDiceY[i]+25) && (y > storedDiceY[i]-25)) {
        sum -= storedDiceRolls[i];
        if (i <= 8) {
          die newDice = new die((i+1)*60, 60);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
        if (i > 8 && i <= 17) {
          die newDice = new die((i-8)*60, 120);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
        if (i > 17 && i <= 26) {
          die newDice = new die((i-17)*60, 180);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
        if (i > 26 && i <= 35) {
          die newDice = new die((i-26)*60, 240);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
        if (i > 35 && i <= 44) {
          die newDice = new die((i-35)*60, 300);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
        if (i > 44 && i <= 53) {
          die newDice = new die((i-44)*60, 360);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
        if (i > 53 && i <= 62) {
          die newDice = new die((i-53)*60, 420);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
        if (i > 62 && i <= 71) {
          die newDice = new die((i-62)*60, 480);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
        if (i > 71 && i <= 80) {
          die newDice = new die((i-71)*60, 540);
          storedDiceRolls[i] = newDice.diceRoll;
          newDice.show();
        }
      }
    }
  }
}

int sum = 0;

class die {
  int diceX, diceY, diceRoll;
  die(int x, int y) {
    roll();
    diceX = x;
    diceY = y;
  }

  void show() {
    //Dice square
    fill(#FFFFFF);
    strokeWeight(1);
    stroke(0, 0, 0);
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
  }

  void roll() {
    diceRoll = (int)(Math.random()*6)+1;
    sum += diceRoll;
  }
}

void button() { //Button that changes siz of dice
  fill(#C40202);
  rectMode(CENTER);
  strokeWeight(1);
  stroke(0, 0, 0);
  rect(150, 582, 200, 20, 15);
  fill(#FFFFFF);
  text("Click Here To Reroll", 150, 586);
  if (mousePressed == true) {
    if (mouseX >= 50 && mouseX <= 270 && mouseY >= 575 && mouseY <= 590) {
      sum = 0;
      reroll();
    }
  }
}

void reroll() {
  int i = 0;
  for (int y = 60; y <= 540; y += 60) { //9 rows
    for (int x = 60; x <= 540; x += 60) { //9 columns
      die newDice = new die(x, y);
      newDice.show();
      storedDiceX[i] = x;
      storedDiceY[i] = y;
      storedDiceRolls[i] = newDice.diceRoll;
      i++;
    }
  }
}









/*else if (siz == 0.5) { //Display Smaller Dice
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
 */

/*else if (siz == 0.5) {
 for (int y = 30; y <= 540; y += 30) { //9 rows
 for (int x = 30; x <= 570; x += 30) { //9 columns
 die dice1 = new die(x, y);
 dice1.show();
 }
 }
 }
 */
