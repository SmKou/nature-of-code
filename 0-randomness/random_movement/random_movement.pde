int n = 5;
float[][] coordinates;
float[][] direction;
color[] colors;

int size = 20;
int speed = 5;
int dim = 360;

void settings() {
  size(dim, dim);
}

void setup() {
  frameRate(5);
  
  coordinates = new float[n][];
  for (int i = 0; i < coordinates.length; ++i) {
    coordinates[i] = new float[2];
    switch (i % 4) {
      case 0:
        coordinates[i][0] = dim / 2 - size;
        coordinates[i][1] = dim / 2 - size;
        break;
      case 1:
        coordinates[i][0] = dim / 2 + size;
        coordinates[i][1] = dim / 2 + size;
        break;
      case 2:
        coordinates[i][0] = dim / 2 - size;
        coordinates[i][1] = dim / 2 + size;
        break;
      default:
        coordinates[i][0] = dim / 2 + size;
        coordinates[i][1] = dim / 2 - size;
    }
  }
  
  colors = new color[n];
  for (int i = 0; i < colors.length; ++i)
    colors[i] = color(random(255), random(255), random(255));
  
  direction = new float[n][];
  for (int i = 0; i < direction.length; ++i)
    direction[i] = new float[2];
}

void draw() {
  background(255);
  for (int i = 0; i < coordinates.length; ++i) {
    noStroke();
    fill(colors[i]);
    ellipse(coordinates[i][0], coordinates[i][1], size, size);
  }
  
  for (int i = 0; i < coordinates.length; ++i)
    move(i);
}

void move(int i) {
  float r = floor(random(2));
  if (r == 0.0)
    r = -1.0;
    
  if (direction[i][1] == r)
    direction[i][0] = r;
  else
    direction[i][0] = 0;
  direction[i][1] = r;
  
  coordinates[i][0] += direction[i][0] * speed;
  coordinates[i][1] += direction[i][1] * speed;
  
  coordinates[i][0] = check_bounds(coordinates[i][0]);
  coordinates[i][1] = check_bounds(coordinates[i][1]);
}

float check_bounds(float coord) {
  if (coord < 0)
    coord = dim - size / 2;
  if (coord > dim)
    coord = size / 2;
  return coord;
}
