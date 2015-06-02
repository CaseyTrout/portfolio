void setup() {
  size(600,600);
  frameRate(1);
}

void draw() {
  background(255);
  fill(random(245,255),random(210,240),random(160,185));
  ellipse(150,300,random(100,200),random(100,200));
  ellipse(450,300,random(100,200),random(100,200));
  ellipse(300,300,random(300,400),random(400,500));
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(225,275,random(30,50),random(30,50));
  ellipse(375,275,random(30,50),random(30,50));
  fill(0);
  ellipse(225,275,random(5,15),random(5,15));
  ellipse(375,275,random(5,15),random(5,15));
  line(300,275,275,350);
  line(random(210,250),random(380,440),random(335,375),random(380,440));
  line(random(190,210),random(225,250),random(240,260),random(225,250));
  line(random(340,360),random(225,250),random(390,410),random(225,250));
}

