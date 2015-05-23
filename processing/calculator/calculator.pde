//Instantiate each of the classification of buttons
CalcButton[] numButtons = new CalcButton[10];
CalcButton[] opButtons = new CalcButton[10];
CalcButton[] spButtons = new CalcButton[1];

//Global variable
String displayValue = "0";
String valueToCompute = "";  //String value left of operator
String valueToCompute2 = ""; //String vlaue right of operator
float valueToComputeI = 0;   //Float value left of operator
float valueToComputeI2 = 0;  //Float value right of operator
float result = 0;
char opValue;
boolean firstNum;

void setup() {
  size(260, 400);
  background(230);
  frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(215);
  rect(1, 1, 257, 397);

  //Populate number buttons
  numButtons[0] = new CalcButton(80, 290).asNumber(0, 40, 40, 94, 318);
  numButtons[1] = new CalcButton(20, 235).asNumber(1, 40, 40, 33, 263);
  numButtons[2] = new CalcButton(80, 235).asNumber(2, 40, 40, 94, 263);
  numButtons[3] = new CalcButton(140, 235).asNumber(3, 40, 40, 153, 263);
  numButtons[4] = new CalcButton(20, 180).asNumber(4, 40, 40, 33, 208);
  numButtons[5] = new CalcButton(80, 180).asNumber(5, 40, 40, 93, 208);
  numButtons[6] = new CalcButton(140, 180).asNumber(6, 40, 40, 153, 208);
  numButtons[7] = new CalcButton(20, 125).asNumber(7, 40, 40, 33, 153);
  numButtons[8] = new CalcButton(80, 125).asNumber(8, 40, 40, 93, 153);
  numButtons[9] = new CalcButton(140, 125).asNumber(9, 40, 40, 155, 154);

  //Set the initial value of first number to true
  firstNum = true;

  //Poplulate operator buttons
  opButtons[0] = new CalcButton(195, 290).asOperator("+", 40, 40, 207, 318);
  opButtons[1] = new CalcButton(195, 235).asOperator("-", 40, 40, 209, 262);
  opButtons[2] = new CalcButton(195, 180).asOperator("*", 40, 40, 210, 211);
  opButtons[3] = new CalcButton(195, 125).asOperator("÷", 40, 40, 207, 152);
  opButtons[4] = new CalcButton(20, 345).asOperator("=", 216, 40, 123, 373);
  opButtons[5] = new CalcButton(140, 290).asOperator("00", 40, 40, 147, 318);
  opButtons[6] = new CalcButton(140, 70).asOperator("%", 40, 40, 154, 98);
  opButtons[7] = new CalcButton(20, 70).asOperator("C", 40, 40, 32, 98);
  opButtons[8] = new CalcButton(195, 70).asOperator("^", 40, 40, 208, 100);
  opButtons[9] = new CalcButton(80, 70).asOperator("√", 40, 40, 92, 100);

  //Populate special buttons
  spButtons[0] = new CalcButton(20, 290).asSpecial(".", 40, 40, 37, 318);
}

void draw() {
  //Draw number buttons
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.display();
  }
  //Draw operator buttons
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iopButton = opButtons[i];
    iopButton.display();
  }
  //Draw special buttons
  for (int i=0; i<spButtons.length; i++) {
    CalcButton ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.clickButton();
    if (inumButton.overBox) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iOpButton = opButtons[i];
    iOpButton.clickButton();
    if (iOpButton.overBox) {
      if (iOpButton.opButtonValue == "+") {
        if (result !=0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
          valueToCompute2 = "";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "-") {
        if (result !=0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
          valueToCompute2 = "";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "*") {
        if (result !=0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "*";
          valueToCompute2 = "";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      } else if (iOpButton.opButtonValue == "÷") {
        if (result !=0) {
          opValue = '÷';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "÷";
          valueToCompute2 = "";
        } else {
          opValue = '÷';
          firstNum = false;
          displayValue = "÷";
        }
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == "00") {
        opValue = 'd';
        performCalculation();
      } else if (iOpButton.opButtonValue == "%") {
        opValue = '%';
        performCalculation();
      } else if (iOpButton.opButtonValue == "^") {
        if (result !=0) {
          opValue = '^';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "^";
          valueToCompute2 = "";
        } else {
          opValue = '^';
          firstNum = false;
          displayValue = "^";
        }
      } else if (iOpButton.opButtonValue == "√") {
        opValue = '√';
        performCalculation();
      } else if (iOpButton.opButtonValue == "=") {
        //Perform Calculation
        firstNum = true;
        performCalculation();
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    CalcButton iSpButton = spButtons[i];
    iSpButton.clickButton();
    if (iSpButton.overBox) {
      if (iSpButton.spButtonValue == ".") {
        //concanteneate the values clicked on
        if (firstNum) {
          valueToCompute += iSpButton.spButtonValue;
          displayValue = valueToCompute;
        } else {
          valueToCompute2 += iSpButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}

void performCalculation() {
  //Set string value to floats
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);
  //Perform calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '÷') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'd') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*100;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*100;
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == '%') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*0.010000000;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*0.010000000;
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == '^') {
    if (firstNum) {
      result = pow(valueToComputeI, valueToComputeI2);
      displayValue = str(result);
    }
  } else if (opValue == '√') {
    if (firstNum) {
      result = sqrt(valueToComputeI);
      displayValue = str(result);
    }
  }
  //let = work multiple times
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  }
}

void handleKeyPressOp(String keyPress) {
  if (keyPress == "C") {
    displayValue = "0";
    opValue = 'C';
    valueToCompute = "";
    valueToCompute2 = "";
    valueToComputeI = 0;
    valueToComputeI2 = 0;
    result = 0;
    firstNum = true;
  } else if (keyPress == "=") {
    firstNum = true;
    performCalculation();
  } else if (keyPress == "+") {
    if (result !=0) {
      opValue = '+';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "+";
      valueToCompute2 = "";
    } else {
      opValue = '+';
      firstNum = false;
      displayValue = "+";
    }
  } else if (keyPress == "-") {
    if (result !=0) {
      opValue = '-';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "-";
      valueToCompute2 = "";
    } else {
      opValue = '-';
      firstNum = false;
      displayValue = "-";
    }
  } else if (keyPress == "*") {
    if (result !=0) {
      opValue = '*';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "*";
      valueToCompute2 = "";
    } else {
      opValue = '*';
      firstNum = false;
      displayValue = "*";
    }
  } else if (keyPress == "/") {
    if (result !=0) {
      opValue = '÷';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "÷";
      valueToCompute2 = "";
    } else {
      opValue = '÷';
      firstNum = false;
      displayValue = "÷";
    }
  }
}

  void keyPressed() {
    if (key == '1' || keyCode == 83 || keyCode == 18) {
      handleKeyPressNum("1");
    } else if (key == '2' || keyCode == 84 || keyCode == 19) {
      handleKeyPressNum("2");
    } else if (key == '3' || keyCode == 85 || keyCode == 20) {
      handleKeyPressNum("3");
    } else if (key == '4' || keyCode == 86 || keyCode == 21) {
      handleKeyPressNum("4");
    } else if (key == '5' || keyCode == 87 || keyCode == 22) {
      handleKeyPressNum("5");
    } else if (key == '6' || keyCode == 88 || keyCode == 23) {
      handleKeyPressNum("6");
    } else if (key == '7' || keyCode == 89 || keyCode == 23) {
      handleKeyPressNum("7");
    } else if (key == '8' || keyCode == 90 || keyCode == 24) {
      handleKeyPressNum("8");
    } else if (key == '9' || keyCode == 91 || keyCode == 25) {
      handleKeyPressNum("9");
    } else if (key == '0' || keyCode == 82 || keyCode == 29) {
      handleKeyPressNum("0");
    } else if (key == '=' || keyCode == 13 || keyCode == RETURN || keyCode == ENTER) {
      handleKeyPressOp("=");
    } else if (keyCode == 8 || keyCode == 46 || keyCode == DELETE || keyCode == 12) {
      handleKeyPressOp("C");
    } else if (key == '+') {
      handleKeyPressOp("+");
    } else if (key == '-') {
      handleKeyPressOp("-");
    } else if (key == '*') {
      handleKeyPressOp("*");
    } else if (key == '/') {
      handleKeyPressOp("/");
    }
  }

  void updateDisplay() {
    fill(200, 200, 150);
    rect(20, 20, 220, 35, 7);
    fill(0);
    textSize(25);
    text(displayValue, 30, 47);
  }

class CalcButton {
  //Class variable
  boolean isNumber;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  //int boxSize = 40;
  int buttonW = 40;
  int buttonH = 40;
  int textXpos;
  int textYpos;
  boolean overBox = false;

  //Constructor
  CalcButton(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    //println(numButtonValue);
  }

  //Constructor for number buttons
  CalcButton asNumber(float tempNumButtonValue, int tempW, int tempH, int tempTextX, int tempTextY) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    textXpos = tempTextX;
    textYpos = tempTextY;
    return this;
  }

  //Constructor for operator buttons
  CalcButton asOperator(String tempOpButtonValue, int tempW, int tempH, int tempTextX, int tempTextY) {
    isNumber = false;
    opButtonValue = tempOpButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    textXpos = tempTextX;
    textYpos = tempTextY;
    return this;
  }

  //Constructor for special buttons
  CalcButton asSpecial(String buttonValue, int tempW, int tempH, int tempTextX, int tempTextY) {
    isSpecial = true;
    spButtonValue = buttonValue;
    buttonW = tempW;
    buttonH = tempH;
    textXpos = tempTextX;
    textYpos = tempTextY;
    return this;
  }

  //Draw the button on the canvas
  void display() {
    //Draw rounded edged button on canvas
    if (overBox) {
      fill(255);
    }
    if (isNumber) {
      fill(255);
      stroke(50);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(22);
      text(int(numButtonValue), textXpos, textYpos);
    } else if (isSpecial) {
      fill(255);
      stroke(50);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(22);
      text(spButtonValue, textXpos, textYpos);
    } else {
      if (opButtonValue == "00") {
        fill(255);
        stroke(50);
        strokeWeight(2);
        rect(xpos, ypos, buttonW, buttonH, 10);
        fill(0);
        textSize(22);
        text(opButtonValue, textXpos, textYpos);
      } else {
        fill(207);
        stroke(50);
        strokeWeight(2);
        rect(xpos, ypos, buttonW, buttonH, 10);
        fill(0);
        textSize(22);
        text(opButtonValue, textXpos, textYpos);
      }
    }
  }

    //Handle mouse actions
    void clickButton() {
      overBox = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
    }
  }

