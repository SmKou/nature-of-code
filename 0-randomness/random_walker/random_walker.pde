Walker walker;

void setup() {
  size(640, 240);
  background(255);
  walker = new PerlinWalker2();
}

void draw() {
  walker.step();
  walker.show();
}

class Walker {
  float x, y;
  
  Walker() {
    x = width / 2;
    y = height / 2;
  }
  
  void show() {
    stroke(0);
    point(x, y);
  }
  
  void step() {
    int choice = floor(random(4));
    
    if (choice == 0)       x++;
    else if (choice == 1)  x--;
    else if (choice == 2)  y++;
    else                   y--;
  }
}

class DownRightWalker extends Walker {
  DownRightWalker() {
    super();
  }
  
  void step() {
     float choice = random(5);
     if (choice < 2) {
       x++;
       y++;
     }
     else if (choice < 3) x++;
     else if (choice < 4) x--;
     else if (choice < 5) y++;
     else                 y--;
       
     if (x > width - 1)   x = 0;
     else if (x < 1)      x = width;
       
     if (y > height - 1)  y = 0;
     else if (y < 1)      y = height;
  }
}

class RightWalker extends Walker {
  RightWalker() { super(); }
  
  void step() {
    float r = random(1);
    if (r < 0.4)       x++;
    else if (r < 0.6)  x--;
    else if (r < 0.8)  y++;
    else               y--;
  }
}

/* Bug: Stops or remains at edges */
class MouseWalker extends Walker {
  MouseWalker() { super(); }
  
  void step() {
    int r = floor(random(2));
    switch (r) {
      case 0:
        float dx = (mouseX - x) / abs(mouseX - x);
        float dy = (mouseY - y) / abs(mouseY - y);
        x += dx;
        y -= dy;
        break;
      case 1:
        int choice = floor(random(4));
        switch (choice) {
           case 0:  x++;
           case 1:  x--;
           case 2:  y++;
           default: y--;
        }
    }
    
    if (x < 1)               x = width;
    else if (x > width - 1)  x = 0;
    
    if (y < 1)               y = height;
    else if (y > height - 1) y = 0;
  }
}

class GaussianWalker extends Walker {
  GaussianWalker() { super(); }
  
  void step() {
    float dx = floor(randomGaussian() * 2 + 2);
    float dy = floor(randomGaussian() * 2 + 2);
    x += dx;
    y += dy;
    
    if (x < 1)               x = width;
    else if (x > width - 1)  x = 0;
    
    if (y < 1)               y = height;
    else if (y > height - 1) y = 0;
  }
}

class PerlinWalker extends Walker {
  float tx = 0.0;
  float ty = 1.0;
  PerlinWalker() { super(); }
  
  void step() {
    float n = noise(tx);
    x = map(n, 0, 1, 0, width);
    n = noise(ty);
    y = map(n, 0, 1, 0, height);
    
    tx += 0.01;
    ty += 0.01;
  }
}

class PerlinWalker2 extends Walker {
  float tx = 0.0, ty = 1.0;
  PerlinWalker2() { super(); }
  
  void step() {
    float n = noise(tx);
    x += map(n, 0, 1, -2, 2);
    n = noise(ty);
    y += map(n, 0, 1, -2, 2);
    
    if (x < 1)               x = width;
    else if (x > width - 1)  x = 0;
    
    if (y < 1)               y = height;
    else if (y > height - 1) y = 0;
    
    tx += 0.01;
    ty += 0.01;
  }
}
