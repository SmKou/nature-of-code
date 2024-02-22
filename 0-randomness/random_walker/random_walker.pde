Walker walker;

void setup() {
  size(640, 240);
  background(255);
  walker = new Walker();
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
    
    if (choice == 0)
      x++;
    else if (choice == 1)
      x--;
    else if (choice == 2)
      y++;
    else
      y--;
  }
}
