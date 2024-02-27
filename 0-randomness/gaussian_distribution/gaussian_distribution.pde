void setup() {
  size(640, 260);
}

void draw() {
  float x = rG(320, 60);
  println(x);
  noStroke();
  fill(0, 10);
  circle(x, 120, 16);
}

float rG(float mean, float standard_deviation) {
  return randomGaussian() * standard_deviation + mean;
}
