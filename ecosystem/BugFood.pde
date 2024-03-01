class BugFood {
  float x, y;
  int size, ds = 1;
  color c;
  int idx;
  int life = 100;
  boolean status = true;
  
  BugFood(float x, float y, int idx) {
    this.x = x;
    this.y = y;
    size = floor(random(1, 16));
    c = randColor();
    this.idx = idx;
  }
  
  boolean lifeSpan() {
    return life > 0;
  }
  
  void radiate() {
    if (!status) {
      if (ds > 0)
        ds *= -1;
      else if (size < 2) {
        bugfood[idx] = null;
        count--;
      }
      else
        size += ds;
      return;
    }
    size += ds;
    if (size == 2 || size == 16)
      ds *= -1;
  }
  
  void render() {
    fill(c);
    noStroke();
    circle(x, y, size);
  }
}
