/*
If you tweak the parameters and play with color, 
the resulting images look more like marble, wood, 
or any other organic texture.

noiseDetail()
*/

Painter painter;

void setup() {
  size(640, 240);
  painter = new ZOffPainter();
}

void draw() {
  background(255);
  painter.paint();
}

class Painter {
  float xoff, tx = 0.0;
  float yoff, ty = 0.0;
  void paint() {
    xoff = tx;
    for (int x = 0; x < width; x++) {
      yoff = ty;
      for (int y = 0; y < height; y++) {
        float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
        set(x, y, color(floor(bright)));
        yoff += 0.01;
      }
      xoff += 0.01;
    }
    
    tx += 0.01;
    ty += 0.01;
  }
}

class ZOffPainter extends Painter {
  float zoff = 0.0;
  ZOffPainter() { super(); }
  void paint() {
    xoff = tx;
    for (int x = 0; x < width; x++) {
      yoff = ty;
      for (int y = 0; y < height; y++) {
        float bright = map(noise(xoff, yoff, zoff), 0, 1, 0, 255);
        set(x, y, color(floor(bright)));
        yoff += 0.01;
      }
      xoff += 0.01;
      zoff += 0.00001;
    }
  }
}
