BugFood[] bugfood;
int count = 0;

JitteryBug bug;

void setup() {
  size(640, 640);
  bugfood = new BugFood[10];
  for (int i = 0; i < bugfood.length; i++)
    bugfood[i] = null;
  bug = new JitteryBug();
}

void draw() {
  background(255);
  float t = random(0, 30);
  float dt = randomGaussian() * 5 + 15;
  if (count < 5 && t < dt) {
    int idx = 0;
    for (int i = 0; i < bugfood.length; i++)
      if (bugfood[i] != null)
        idx++;
    bugfood[idx] = new BugFood(random(width), random(height), idx);
    count++;
  }
  
  if (count == 5 && t < dt) {
    int r = floor(random(bugfood.length));
    if (bugfood[r] != null && !bugfood[i].lifeSpan())
      bugfood[r].status = false;
  }
  
  for (int i = 0; i < bugfood.length; i++)
    if (bugfood[i] != null) {
      bugfood[i].radiate();
      bugfood[i].render();
    }
      
  bug.step();
  bug.render();
}

color randColor() {
  int r = floor(random(255));
  int g = floor(random(255));
  int b = floor(random(255));
  return color(r, g, b);
}
