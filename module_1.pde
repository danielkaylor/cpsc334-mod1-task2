  
float yPos, xPos = 0.0;
float xChange, yChange;
float firstX, firstY, lastX, lastY;
float lastcX, lastcY, firstcX, firstcY;
float r, g, b;
float t;
float x, y;
int counter;

ArrayList<PVector> points = new ArrayList<PVector>();
Ellipse[] ellipses = new Ellipse[15];
Box[] boxes = new Box[30];

void assignBoxes() {
  
  counter = 0;
  
  for(int i = 0; i < 30; i++) {
    if (counter < 3) {
      //for the first three half-boxes
      boxes[i] = new Box(((2*width)/3.0) + (counter % 3) * (width/9.0) + (width/18.0), (height/19.0) * (1/2.0));
    } else {
      //for the rest of the boxes
      boxes[i]  = new Box(((2*width)/3.0) + (counter % 3) * (width/9.0) + (width/18.0), (height/(19.0/2) * floor(counter/3.0)));
    }  
    counter++;
  }
}

//for the boxes on the right side of the display
class Box {
  float xpos;
  float ypos;
  float h;
  float w;
  boolean lit;
  ////for lit up box that grows
  //float wGrow;
  //float hGrow;
  
  Box(float x, float y){
    xpos = x;
    ypos = y;
    if (counter < 3) {
      h = height / 19.0;
    } else {
      h = height / (19.0/2);
    }
    w = width/9.0;
    lit = false;
    //wGrow = 0.0;
    //hGrow = 0.0;
  }
  
  void display() {
    rectMode(CENTER);
    //if (lit) {
    //  fill(0, 0, 0);
    //  rect(xpos, ypos, w, h);
    //  r = noise(frameCount * 0.005) * 50;
    //  g = noise(frameCount * .025) * 255;
    //  b = noise(frameCount * .03) * 200;
    //  fill(r, g, b);
    //  rect(xpos, ypos, wGrow, hGrow);      
    //} else {
    rect(xpos, ypos, w, h);
    //}
    
  }
  
  //void grow() {
  //  if (wGrow <= width/19.0) {
  //    w += 0.1;
  //  }
  //  if (hGrow <= height/ (19.0/2)) {
  //    h += 0.1;
  //  }
  //}
}

class Ellipse {
  int num;
  float xpos;
  float ypos;
  float w; //width
  float h; //height
  boolean touched;
  
  Ellipse(float x, float y, int n) {
    num = n;
    xpos = x;
    ypos = y;
    w = 10;
    h = 10;
    touched = false;
  }
  
  void grow() {
    if (w <= 56) {
      w += 0.1;
    }
    if (h <= 36) {
      h += 0.1;
    }
  }
  
  void display() {
    if (!touched) {
      r = noise(frameCount * 0.03) * 255;
      g = noise(frameCount * .005) * 50;
      b = noise(frameCount * .005) * 50;
      fill(r, g, b);
      ellipse(xpos, ypos, w + (sin(frameCount/5)*10), h + (sin(frameCount/5)*10));
    } else {
      r = noise(frameCount * 0.005) * 50;
      g = noise(frameCount * .025) * 255;
      b = noise(frameCount * .03) * 200;
      fill(r, g, b);
      grow();
      if(w >= 56 && h >= 36) {
        rectMode(CENTER);
        rect(xpos, ypos, 48, 30);
      } else {
        ellipse(xpos, ypos, w, h);
      }
    }
  }
}
void setup() {  // setup() runs once
  size(1920, 1200);
  //fullScreen();
  
  frameRate(60);
  firstX = random(frameCount % width);
  firstY = random(height);
  firstcX = random(frameCount % width);
  firstcY = random(height);
  lastcX = random(frameCount % width);
  lastcY = random(height);
  lastX = random(frameCount % width);
  lastY = random(height);
  t = 0.0;
  
  //print("hello");
  assignBoxes();
  //print("goodbye");
  
  Ellipse e0 = new Ellipse(24, 821, 0);
  ellipses[0] = e0;
  Ellipse e1 = new Ellipse(142, 877, 1);
  ellipses[1] = e1;
  Ellipse e2 = new Ellipse(189, 847, 2);
  ellipses[2] = e2;
  Ellipse e3 = new Ellipse(257, 847, 3);
  ellipses[3] = e3;
  Ellipse e4 = new Ellipse(365, 877, 4);
  ellipses[4] = e4;
  Ellipse e5 = new Ellipse(550, 847, 5);
  ellipses[5] = e5;
  Ellipse e6 = new Ellipse(597, 817, 6);
  ellipses[6] = e6;
  Ellipse e7 = new Ellipse(702, 817, 7);
  ellipses[7] = e7;
  Ellipse e8 = new Ellipse(764, 875, 8);
  ellipses[8] = e8;
  Ellipse e9 = new Ellipse(811, 875, 9);
  ellipses[9] = e9;
  Ellipse e10 = new Ellipse(858, 845, 10);
  ellipses[10] = e10;
  Ellipse e11 = new Ellipse(907, 970, 11);
  ellipses[11] = e11;
  Ellipse e12 = new Ellipse(952, 816, 12);
  ellipses[12] = e12;
  Ellipse e13 = new Ellipse(999, 846, 13);
  ellipses[13] = e13;
  Ellipse e14 = new Ellipse(1108, 944, 14);
  ellipses[14] = e14;
}

float stepSize = 1.0/frameRate;

void draw() {
  //background(0, 255, 0);
  //stroke(0, 0, 255);
  strokeWeight(1);
  fill(255, 10);
  rectMode(CORNERS);
  rect(0, 0, width, height);
  
  fill(0, 0, 0); //black rectangle for right two thirds of screen
  rect(0, 0, 2*width/3, height);
  
  //red color for pulsating circles
  r = noise(frameCount * 0.03) * 255;
  g = noise(frameCount * .005) * 50;
  b = noise(frameCount * .005) * 50;
  fill(r, g, b);
  
  for (Ellipse ellipse : ellipses) {
    ellipse.display();
  }
  
  strokeWeight(4);
  r = noise(frameCount * 0.11) * 255;
  g = noise(frameCount * .033) * 255;
  b = noise(frameCount * .025) * 255;
  stroke(r, g, b);
  
  fill(0, 0, 0);
  for(int i = 0; i < 30; i++) {
    boxes[i].display();
  }
  
  noFill();
  drawCurve();
  
  for (Ellipse ellipse : ellipses) {
    if ((abs(ellipse.xpos - x) < ellipse.w && abs(ellipse.ypos - y) < ellipse.h) || ellipse.touched) {
      ellipse.touched = true;
      ellipse.display();
      boxes[ellipse.num * 2].lit = true;
      boxes[ellipse.num * 2].display();
      boxes[ellipse.num * 2 + 1].lit = true;
      boxes[ellipse.num * 2 + 1].display();
    }
  }
  if(frameCount % 60 == 0) {
    firstX = lastX;
    firstY = lastY;
    xChange = lastX - lastcX;
    yChange = lastY - lastcY;
    firstcX = lastX + xChange;
    firstcY = lastY + yChange;
    lastX = random(width);
    lastY = random(4/5.0 * height, height);
    lastcX = random(width);
    lastcY = random(height);
    t = 0.0;
  }
  t += stepSize;
}

void drawCurve() {
  //stroke(255, 0, 0);
  //draw previous points
  beginShape();
  for (PVector point : points) {
    curveVertex(point.x, point.y);
  }
  endShape();

  //add a new point
  //PVector prevPoint = points.get(points.size()-1);

  x = (1-t)*(1-t)*(1-t)*firstX + 3*(1-t)*(1-t)*t*firstcX + 3*(1-t)*t*t*lastcX + t*t*t*lastX;
  y = (1-t)*(1-t)*(1-t)*firstY + 3*(1-t)*(1-t)*t*firstcY + 3*(1-t)*t*t*lastcY + t*t*t*lastY;
  points.add(new PVector(x, y));
}
