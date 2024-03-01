class JitteryBug {
  float x, tx = 0.0;
  float y, ty = 0.0;
  int counter = 300;
  
  JitteryBug() {
    x = random(width / 2) + (width / 2);
    y = random(height / 2) + (height / 2);
  }
  
  void render() {
    stroke(0);
    fill(255);
    circle(x, y, 5);
  }
  
  void step() {
    counter--;
    if (counter > 0) {
      randomWalk();
      return;
    }
    
    BugFood nearest_food = null;
    float nearest_dist = width;
    for (int i = 0; i < bugfood.length; i++) {
      if (bugfood[i] == null)
        continue;
      float dist = dist(bugfood[i].x, bugfood[i].y, x, y);
      if (dist < 1) {
        bugfood[i] = null;
        count--;
      }
      if (dist < 60 && dist < nearest_dist) {
        nearest_dist = dist;
        nearest_food = bugfood[i];
      }
    }
    
    if (nearest_food != null) {
      float n = noise(tx);
      if (nearest_food.x - x < 0)
        x += map(n, 0, 1, nearest_food.x - x, -1);
      else
        x += map(n, 0, 1, 1, nearest_food.x - x);
        
      n = noise(ty);
      if (nearest_food.x - x < 0)
        y += map(n, 0, 1, nearest_food.x - x, -1);
      else
        y += map(n, 0, 1, 1, nearest_food.x - x);
        
      return;
    }
    else
      randomWalk();
  }
  
  void randomWalk() {
    float n = noise(tx);
    x = map(n, 0, 1, 0, width);
    n = noise(ty);
    y = map(n, 0, 1, 0, height);
    tx += 0.01;
    ty += 0.01;
  }
}
