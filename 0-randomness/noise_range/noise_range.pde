float t = 0.0;
float step = 0.01;
PVector range;

/* Note: flicker at larger steps
*/

void setup() {
  size(360, 240);
  range = new PVector(35, height - 40);
}

void draw() {
  background(255);
  float xoff = t;
  float step = map(range.x, 35, width - 35, 0.01, 0.1);
  
  noFill();
  stroke(0);
  strokeWeight(2);
  beginShape();
  for (int i = 0; i < width; i++) {
    float y = noise(xoff) * height;
    xoff += step;
    vertex(i, y);
  }
  endShape();
  t += 0.01;
  
  fill(0);
  noStroke();
  rect(40, height - 45, width - 80, 10);
  circle(40, height - 40, 10);
  circle(width - 40, height - 40, 10);
  
  fill(255);
  stroke(0);
  strokeWeight(2);
  circle(range.x, range.y, 20);
  
  fill(0);
  textSize(12);
  text(String.valueOf(step), width - 40, 20);
}

void mouseDragged() {
  if (mouseY < height - 30 && mouseY > height - 50) {
    float dist = mouseX - range.x;
    range.x += dist;
    
    if (range.x < 35)
      range.x = 35;
    else if (range.x > width - 35)
      range.x = width - 35;
  }
}
