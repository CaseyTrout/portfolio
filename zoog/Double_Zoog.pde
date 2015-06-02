void setup() {
  // Set the size of the window
  size(500,500);
}

void draw() {
  // Draw a white background
  background(0,255,255);
  zoog(mouseX-70,mouseY, #11B2EA);
  zoog(mouseX+70,mouseY, color(125,50,70));
  zoog(mouseX,mouseY, 255);  
}

void zoog(int xpos, int ypos, color c1) {
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  // Draw Zoog's body
  stroke(0);
  fill(c1);
  rect(xpos,ypos,20,100);
  
  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(xpos,ypos-70,60,60);
  
  // Draw Zoog's eyes
  fill(0,155,0);
  ellipse(xpos-19,ypos-70,16,32);
  ellipse(xpos+19,ypos-70,16,32);
  
  // Draw Zoog's legs
  stroke(0);
  line(xpos-10,ypos+50,xpos-20,ypos+75);
  line(xpos+10,ypos+50,xpos+20,ypos+75);
  
  // Draw Zoog's arm
  stroke(0);
  line(xpos-10,ypos-10,xpos-20,ypos-20);
  line(xpos+10,ypos-10,xpos+20,ypos-20);
  
  // Draw Zoog's mouth
  fill(0);
  ellipse(xpos,ypos-50,10,10);
  
  // Draw Zoog's tie
  fill(255,0,0);
  quad(xpos,ypos+15,xpos-5,ypos-15,xpos,ypos-30,xpos+5,ypos-15);
  
  // Draw Zoog's shoes
  fill(255,0,0);
  ellipse(xpos-20,ypos+75,12,8);
  ellipse(xpos+20,ypos+75,12,8);
}
  

