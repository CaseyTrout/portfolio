// Instatiate each of the buttons
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
Button[] spButtons = new Button[1];

// Global Variables
String displayValue = "0";
String valueToCompute = ""; // string value left of operator
String valueToCompute2 = ""; // string value right of operator
float valueToComputeI = 0; // float value left of operator
float valueToComputeI2 = 0; // float value right of operator
float result = 0;
char opValue;
boolean firstNum;

void setup() {
  size(250, 300);
  background(255);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect(1, 1, 327, 327);

  //Populate number buttons
  numButtons[0] = new Button(15, 255).asNumber(0, 85, 30);
  numButtons[1] = new Button(15, 220).asNumber(1, 40, 30);
  numButtons[2] = new Button(60, 220).asNumber(2, 40, 30);
  numButtons[3] = new Button(105, 220).asNumber(3, 40, 30);
  numButtons[4] = new Button(15, 185).asNumber(4, 40, 30);
  numButtons[5] = new Button(60, 185).asNumber(5, 40, 30);
  numButtons[6] = new Button(105, 185).asNumber(6, 40, 30);
  numButtons[7] = new Button(15, 150).asNumber(7, 40, 30);
  numButtons[8] = new Button(60, 150).asNumber(8, 40, 30);
  numButtons[9] = new Button(105, 150).asNumber(9, 40, 30);
  opButtons[0] = new Button(150, 150).asOperator("+", 40, 65);
  opButtons[1] = new Button(150, 220).asOperator("-", 40, 65);
  opButtons[2] = new Button(195, 150).asOperator("*", 40, 65);
  opButtons[3] = new Button(195, 220).asOperator("/", 40, 65);
  opButtons[4] = new Button(15, 80).asOperator("clear", 85, 30);
  opButtons[5] = new Button(150, 115).asOperator("=", 85, 30);
  opButtons[6] = new Button(195, 80).asOperator("n", 40, 30);
  opButtons[7] = new Button(150, 80).asOperator("%", 40, 30);
  opButtons[8] = new Button(105, 115).asOperator("r", 40, 30);
  opButtons[9] = new Button(60, 115).asOperator("s", 40, 30);
  opButtons[10] = new Button(105, 80).asOperator("b", 40, 30);
  opButtons[11] = new Button(15, 115).asOperator("p", 40, 30);
  spButtons[0] = new Button(105, 255).asSpecial(".", 40, 30);
}

void draw() {
  background(255);
  // Draw number buttons
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.display();
  }
  for (int i=0; i<opButtons.length; i++) {
    Button iOpButton = opButtons[i];
    iOpButton.display();
  }
  for (int i=0; i<spButtons.length; i++) {
    Button iSpButton = spButtons[i];
    iSpButton.display();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i = 0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.on) {
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
    Button iOpButton = opButtons[i];
    iOpButton.click();
    if (iOpButton.on) {
      if (iOpButton.opButtonValue == "+") {
        if (result != 0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum=false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "=") {
        // Perform calculation
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "-") {
        if (result != 0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "*") {
        if (result != 0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      } else if (iOpButton.opButtonValue == "/") {
        if (result != 0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "clear") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == "=") {
        // Perform calculation
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "n") {
        opValue = 'n';
        performCalculation();
      } else if (iOpButton.opButtonValue == "%") {
        opValue = '%';
        performCalculation();
      } else if (iOpButton.opButtonValue == "r") {
        opValue = 'r';
        performCalculation();
      } else if (iOpButton.opButtonValue == "s") {
        opValue = 's';
        performCalculation();
      } else if (iOpButton.opButtonValue == "b") {
      } else if (iOpButton.opButtonValue == "p") {
        opValue = 'p';
        performCalculation();
      }
    }
  }

  for (int i=0; i<spButtons.length; i++) {
    Button iSpButton = spButtons[i];
    iSpButton.click();
    if (iSpButton.on) {
      if (iSpButton.spButtonValue == ".") {
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
  // Set string values to floats
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  // perfom calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == '%') {
    if (firstNum) {
      valueToComputeI =  valueToComputeI/100;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2/100;
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 'r') {
    if (firstNum) {
      valueToComputeI = sqrt(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sqrt(valueToComputeI2);
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 's') {
    valueToComputeI = valueToComputeI*valueToComputeI;
    displayValue = str(valueToComputeI);
  } else if (opValue == 'p') {
    valueToComputeI = 3.1415;
    displayValue = str(3.1415);
  } else {
    valueToComputeI2 = valueToComputeI2*valueToComputeI2;
    displayValue = str(valueToComputeI);
  }

  // let = work multiple times
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}

void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  } else if (key == '=' || keyCode == RETURN || keyCode == ENTER) {
    handleKeyPressOp("=");
  } else if (key == ESC) {
    handleKeyPressOp("clear");
  } else if (key == '/') {
    handleKeyPressOp("/");
  } else if (key == '+') {
    handleKeyPressOp("+");
  } else if (key == '-') {
    handleKeyPressOp("-");
  } else if (key == '*') {
    handleKeyPressOp("*");
  } else if (key == 'n') {
    handleKeyPressOp("n");
  } else if (key == '%') {
    handleKeyPressOp("%");
  } else if (key == 'r') {
    handleKeyPressOp("r");
  } else if (key == 's') {
    handleKeyPressOp("s");
  } else if (key == 'p') {
    handleKeyPressOp("p");
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
  if (keyPress == "clear") {
    displayValue = "0";
    opValue = 'C';
    valueToCompute = "";
    valueToCompute2 = "";
    valueToComputeI = 0;
    result = 0;
    firstNum = true;
  } else if (keyPress == "=") {
    // Perform calculation
    firstNum = true;
    performCalculation();
  } else if (keyPress == "+") {
    if (result != 0) {
      opValue = '+';
      valueToCompute2 = "";
      firstNum=false;
      displayValue = "+";
    } else {
      opValue = '+';
      firstNum = false;
      displayValue = "+";
    }
  } else if (keyPress == "-") {
    if (result != 0) {
      opValue = '-';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "-";
    } else {
      opValue = '-';
      firstNum = false;
      displayValue = "-";
    }
  } else if (keyPress == "*") {
    if (result != 0) {
      opValue = '*';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "*";
    } else {
      opValue = '*';
      firstNum = false;
      displayValue = "*";
    }
  } else if (keyPress == "/") {
    if (result != 0) {
      opValue = '/';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "/";
    } else {
      opValue = '/';
      firstNum = false;
      displayValue = "/";
    }
  } else if (keyPress == "%") {
    opValue = '%';
    performCalculation();
  } else if (keyPress == "n") {
    opValue = 'n';
    performCalculation();
  } else if (keyPress == "r") {
    opValue = 'r';
    performCalculation();
  } else if (keyPress == "s") {
    opValue = 's';
    performCalculation();
  } else if (keyPress == "b") {
  } else if (keyPress == "p") {
    opValue = 'p';
    performCalculation();
  }
}

void handleKeyPressSp(String keyPress) {
  if (keyPress == "190") {
    if (firstNum) {
      valueToCompute += keyPress;
      displayValue = valueToCompute;
    } else {
      valueToCompute2 += keyPress;
      displayValue = valueToCompute2;
    }
  }
}

void updateDisplay() {
  fill(230);
  rect(15, 15, 220, 55);
  fill(0);
  textSize(25);
  text(displayValue, 20, 37);
}

class Button {
  // Button location and size
  float x;
  float y;
  float w;
  float h;
  // Class variables
  boolean isNumber;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int boxSize = 45;
  int buttonW = 45;
  int buttonH = 45;
  boolean on = false;
  
  // Constructor initializes all variables
  Button(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    //println(numButtonValue);
  }
  
  Button asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  
  Button asOperator(String tempOpButtonValue, int tempW, int tempH) {
    opButtonValue = tempOpButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  
  Button asSpecial(String tempSpButtonValue, int tempW, int tempH) {
    isSpecial = true;
    spButtonValue = tempSpButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  
  // Draw the button on the canvas
  void display() {
    rectMode(CORNER);
    if(isNumber) {
      fill(0, 220, 255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text(int(numButtonValue), xpos+15, ypos+25);
    } else if (isSpecial) {
      fill(0, 220, 255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text(spButtonValue, xpos+15, ypos+25);
    } else if (opButtonValue == "b") {
      fill(0, 220, 255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text("←", xpos+15, ypos+25);
    } else if (opButtonValue == "n") {
      fill(0, 220, 255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text("±", xpos+15, ypos+25);
    } else if (opButtonValue == "/") {
      fill(0, 220, 255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text("÷", xpos+15, ypos+25);
    } else if (opButtonValue == "*") {
      fill(0, 220, 255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text("×", xpos+15, ypos+25);
    } else if (opButtonValue == "r") {
      fill(0, 220, 255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text("√", xpos+15, ypos+25);
    } else if (opButtonValue == "s") {
      fill(0, 220, 255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text("x", xpos+15, ypos+25);
      textSize(10);
      text("2", xpos+29, ypos+16);
    } else if (opButtonValue == "p") {
      fill(0,220,255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text("π", xpos+15, ypos+25);
    } else {
      fill(0,220,255);
      stroke(0);
      strokeWeight(1);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text(opButtonValue, xpos+15, ypos+25);
    }
  }
  
  // Handle mouse actions
  void click() {
    on = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
  }
}

