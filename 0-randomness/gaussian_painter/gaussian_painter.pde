void setup() {
  size(400, 400);
}

void draw() {
  float x = randomGaussian() * 60 + 200;
  float y = randomGaussian() * 60 + 200;
  int size = floor(randomGaussian() * 3 + 10) + 1;
  
  noStroke();
  fill(random_color());
  circle(x, y, size);
}

color random_color() {
  float r = randomGaussian() * 42.5 + 127.5;
  float g = randomGaussian() * 42.5 + 127.5;
  float b = randomGaussian() * 42.5 + 127.5;
  return color(r, g, b);
}
