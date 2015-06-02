// Global Variable
int x, y;

void setup() {
  size(400,400);
  frameRate(10);
  // Set start coordinates
  x=0;
  y=0;
}
void draw() {}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      if(x>=width) {
        x=width;
      }
      moveRight(1);
    } else if (keyCode == DOWN) {
      if(y>=height) {
        y=height;
      }
      moveDown(1);
    } else if (keyCode == UP) {
      if(y>=height) {
        y=height;
      }
      moveUp(1);
    } else if (keyCode == LEFT) {
      if(x>=width) {
        x=width;
      }
      moveLeft(1);
    } 
  }
}

void mouseClicked() {
  saveFrame("line-######.png");
}

//Method to draw right line
void moveRight(int rep) {
  for(int i=0;i<rep;i++) {
    point(x+i,y);
  }
  x=x+(rep);
}

//Method to draw left line
void moveLeft(int rep) {
  for(int i=0;i<rep;i++) {
    point(x-i,y);
  }
  x=x-(rep);
}

//Method to draw line down
void moveDown(int rep) {
  for(int i=0;i<rep;i++) {
    point(x,y+i);
  }
  y=y+(rep);
}

//Method to draw line up
void moveUp(int rep) {
  for(int i=0;i<rep;i++) {
    point(x,y-i);
  }
  y=y-(rep);
}

//Method to draw right upwards diagonal
void moveRU(int rep) {
  for(int i=0;i<rep;i++) {
    point(x+i,y-i);
  }
  x=x+(rep);
  y=y-(rep);
}

//Method to draw right downwards diagonal
void moveRD(int rep) {
  for(int i=0;i<rep;i++) {
    point(x+i,y+i);
  }
  x=x+(rep);
  y=y+(rep);
}

//Method to draw left upwards diagonal
void moveLU(int rep) {
  for(int i=0;i<rep;i++) {
    point(x-i,y-i);
  }
  x=x-(rep);
  y=y-(rep);
}

//Method to draw left downwards diagonal
void moveLD(int rep) {
  for(int i=0;i<rep;i++) {
    point(x+i,y+i);
  }
  x=x+(rep);
  y=y+(rep);
}

