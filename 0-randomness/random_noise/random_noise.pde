ArrayList<Float> values = new ArrayList<Float>();

void setup() {
  size(360, 240);
  for (int i = 0; i < width; i++)
    values.add(random(height));
}

void draw() {
  background(255);
  
  noFill();
  stroke(0);
  strokeWeight(2);
  beginShape();
  for (int i = 0; i < width; i++) 
    vertex(i, values.get((i + frameCount) % values.size()));
  endShape();
}
