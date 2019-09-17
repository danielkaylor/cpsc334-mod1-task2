  
float yPos, xPos = 0.0;
float xChange, yChange;
float firstX, firstY, lastX, lastY;
float lastcX, lastcY, firstcX, firstcY;
float r, g, b;
float t;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {  // setup() runs once
  fullScreen();
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
}

float stepSize = 1.0/frameRate;

void draw() {
  //background(0, 255, 0);
  //stroke(0, 0, 255);
  fill(255, 10);
  rectMode(CORNERS);
  rect(0, 0, width, height);
  //noFill();
  r = noise(frameCount * 0.11) * 255;
  g = noise(frameCount * .033) * 255;
  b = noise(frameCount * .025) * 255;
  stroke(r, g, b);
  fill(r, g, b);
  drawCurve();
  if(frameCount % 60 == 0) {
    firstX = lastX;
    firstY = lastY;
    xChange = lastX - lastcX;
    yChange = lastY - lastcY;
    firstcX = lastX + xChange;
    firstcY = lastY + yChange;
    lastX = random(frameCount % width);
    lastY = random(height);
    lastcX = random(frameCount % width);
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

  float x = (1-t)*(1-t)*(1-t)*firstX + 3*(1-t)*(1-t)*t*firstcX + 3*(1-t)*t*t*lastcX + t*t*t*lastX;
  float y = (1-t)*(1-t)*(1-t)*firstY + 3*(1-t)*(1-t)*t*firstcY + 3*(1-t)*t*t*lastcY + t*t*t*lastY;
  points.add(new PVector(x, y));
  
  //update variables for next curve
  //firstX = lastX;
  //firstY = lastY;
  //xChange = lastX - lastcX;
  //yChange = lastY - lastcY;
  //firstcX = lastX + xChange;
  //firstcY = lastY + yChange;
  //lastX = random(frameCount % width);
  //lastY = random(height);
  //lastcX = random(frameCount % width);
  //lastcY = random(height);
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
