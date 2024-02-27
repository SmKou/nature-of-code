int total = 20;
float[] randomCounts = new float[total];

void setup() {
  size(640, 240);
  background(255);
  for (int i = 0; i < total; ++i)
    randomCounts[i] = 0;
}

void draw() {
  int index = floor(random(randomCounts.length));
  randomCounts[index]++;
  
  stroke(0);
  fill(127);
  float w = width / randomCounts.length;
  for (int x = 0; x < randomCounts.length; ++x)
    rect(x * w, height - randomCounts[x], w - 1, randomCounts[x]);
}
