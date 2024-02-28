float noiseScale = 0.02;
int i = 120;
int j = 80;

void setup() {
  size(400,400);

  for (int i = 120; i < width-60; i++) {
    for (int j = 80; j < height-100; j++) {
      color c = color(j, i, 0);    
      set(i, j, c);
    }
  }
}

void draw() {
  background(0);
  for (int x = 0; x < width; x++) {
    float noiseVal = noise((mouseX + x) * noiseScale, mouseY * noiseScale);
    // stroke(noiseVal * 255);
    stroke(getStroke(noiseVal));
    line(x, mouseY + noiseVal * 80, x, height);
  }
}

color getStroke(float noiseVal) {
  i += 1;
  if (i >= width - 60)
    i = 120;
  j += 1;
  if (j >= height - 100)
    j = 80;
  return color(j, i, 0, noiseVal * 255);
}
