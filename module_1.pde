  
float yPos, xPos = 0.0;
float xChange, yChange;
float lastX, lastY;
float lastcX, lastcY, firstcX, firstcY;

void setup() {  // setup() runs once
  size(200, 200);
  frameRate(30);
  beginShape();
  vertex(2, 2);
  firstcX = random(width);
  firstcY = random(height);
  lastcX = random(width);
  lastcY = random(height);
  lastX = random(width);
  lastY = random(height);
  xChange = lastX - lastcX;
  yChange = lastY - lastcY;
  bezierVertex(firstcX, firstcY, lastcX, lastcY, lastX, lastY);
  bezierVertex(lastX + xChange, lastY + yChange, random(width), random(height), random(width), random(height));
  endShape();
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
