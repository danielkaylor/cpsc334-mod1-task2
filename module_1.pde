  
float yPos, xPos = 0.0;
float xChange, yChange;
float firstX, firstY, lastX, lastY;
float lastcX, lastcY, firstcX, firstcY;
float r, g, b;

void setup() {  // setup() runs once
  fullScreen();
  frameRate(200);
  firstX = random(width);
  firstY = random(height);
  firstcX = random(width);
  firstcY = random(height);
  lastcX = random(width);
  lastcY = random(height);
  lastX = random(width);
  lastY = random(height);
  xChange = lastX - lastcX;
  yChange = lastY - lastcY;
}

void draw() {
  //background(0, 255, 0);
  //stroke(0, 0, 255);
  fill(255, 10);
  rectMode(CORNERS);
  rect(0, 0, width, height);
  //noFill();
  r = noise(frameCount * 0.01) * 255;
  g = noise(frameCount * .033) * 255;
  b = noise(frameCount * .025) * 255;
  stroke(r, g, b);
  fill(r, g, b);
  if(frameCount % 5 == 0) {
    drawCurve();
  }
}

void drawCurve() {
  //stroke(255, 0, 0);
  bezier(firstX, firstY, firstcX, firstcY, lastcX, lastcY, lastX, lastY);
  firstX = lastX;
  firstY = lastY;
  xChange = lastX - lastcX;
  yChange = lastY - lastcY;
  firstcX = lastX + xChange;
  firstcY = lastY + yChange;
  lastX = random(width);
  lastY = random(height);
  lastcX = random(width);
  lastcY = random(height);
}
 
//void draw() {  // draw() loops forever, until stopped
//  background(204);
//  beginShape();
//  vertex(2, 2);
//  xChange = random(width * -1, width);
//  yChange = random(height * -1, height);
//  lastX = random(width);
//  lastY = random(height);
//  lastcX = random(width);
//  lastcY = random(height);
//  bezierVertex(random(width), random(height), lastcX, lastcY, lastX, lastY);
//  bezierVertex(lastX + xChange, lastY + yChange, lastcX + xChange, lastcY + yChange, 
  
  //bezierVertex();
  
  
//  yPos = yPos - 1.0;
//  if (yPos < 0) {
//    yPos = height;
//  }
//  line(0, yPos, width, yPos);
