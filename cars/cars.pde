// Create an array of car objects
Car[] myCars = new Car[100];

void setup() {
  size(500,500);
  background(255);
  // create array of cars
  for (int i = 0; i < myCars.length; i++) {
    myCars[i] = new Car(random(width), random(height), int(random(30)), color(random(255), random(255), random(255)), random(2));
  }
}

void draw() {
  background(255);
  // draw cars
  for(int i = 0; i < myCars.length; i++) {
    Car iCar = myCars[i];
    iCar.display();
    iCar.drive();
  }
}
class Car {
  // member variables
  int cLength, cHeight, cWeight, cSpeed;
  float xpos, ypos;
  float left;
  color cColor;
  
  // constructor #1
  Car (float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = 5;
    cColor = color(255,0,0);
  }
  
  // constructor #2
  Car (float tempX, float tempY, int tempSpeed, color tempColor, float leftTemp) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = tempSpeed;
    cColor = tempColor;
    left = leftTemp;
  }
  
  // member methods
  void display() {
    rectMode(CENTER);
    //draw road
    fill(100);
    rect(0, ypos, width*2, 43);
    //draw yellow dashed lines
    for(int x=0; x<width; x+=40) {
      fill(255, 255, 0);
      rect(x, ypos, 20, 5);
    }
    // draw tires
    fill(0);
    rect(xpos-9, ypos+10, 10, 4);
    rect(xpos+9, ypos+10, 10, 4);
    rect(xpos-9, ypos-10, 10, 4);
    rect(xpos+9, ypos-10, 10, 4);
    // draw headlights
    fill(255);
    //triangle(xpos+15, ypos+5, xpos+30, ypos+10, xpos+30, ypos+0);
    // draw body
    fill(cColor);
    rect(xpos, ypos, 40, 20);
  }
  
  //Give the car motion
  void drive() {
    //default to the right
    if (left <= 1) {
      xpos+=cSpeed;
      // detect edge
      if (xpos > width) {
        xpos=0;
      }
    } else {
      // move some to the left
      xpos-= cSpeed;
      //detect edge
      if (xpos < 0) {
        xpos=width;
      }
    }
  }
}

