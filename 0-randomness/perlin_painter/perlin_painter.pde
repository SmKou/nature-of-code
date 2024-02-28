float xoff, cx = 0.0;
float yoff, cy = 0.0;

int total = 6;

void setup() {
  size(640, 240);
}

void draw() {
  background(255);
  float xoff = cx;
  for (int x = 0; x < width; x++) {
    float yoff = cy;
    for (int y = 0; y < height; y++) {
      float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
      set(x, y, color(floor(bright)));
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  
  cx += 0.01;
  cy += 0.01;
}
