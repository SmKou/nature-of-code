Regression reg;
int[] randomCounts;
float minProb, maxProb;
int minStep = -3;
int maxStep = 3;

void setup() {
  size(400, 400);
  init();
}

void draw() {
  randomCounts[floor(randomNumber()) + (minStep * -1)]++;
  
  stroke(0);
  fill(127);
  float w = width / randomCounts.length;
  for (int x = 0; x < randomCounts.length; ++x)
    rect(x * w, height - randomCounts[x], w - 1, randomCounts[x]);
}

void mousePressed() {
  init();
}

void init() {
  background(255);
  
  reg = new Regression();
  int p = floor(random(3));
  reg.select_regression(p);
  
  float range1 = reg.calculate(float(minStep));
  float range2 = reg.calculate(float(maxStep));
  
  if (range1 < range2)
    minProb = range1;
  else
    maxProb = range2;
  
  randomCounts = new int[maxStep - minStep];
}

float randomNumber() {
  float r1 = random(minStep, maxStep);
  float p = reg.calculate(r1);
  float r2 = random(minProb, maxProb);
  if (r2 < p)
    return r1;
  else
    return randomNumber();
}

class Regression {
  float m, a, b;
  String model;
  
  void select_regression(int p) {
    switch (p) {
      case 0:
        model = "linear";
        m = random(-3, 3);
        b = random(-3, 3);
        println("regression: " + m + "x + " + b);
        break;
      case 1:
        model = "quadratic";
        a = random(-3, 3);
        m = random(-3, 3);
        b = random(-3, 3);
        println("regression: " + a + "x^2 + " + m + "x + " + b);
        break;
      default:
        model = "cubic";
        a = random(-3, 3);
        m = random(-3, 3);
        b = random(-3, 3);
        println("regression: " + a + "x^3 + " + m + "x + " + b);
    }
  }
  
  float[] variables() {
    return new float[] {m, b, a};
  }
  
  float calculate(float x) {
    switch (model) {
      case "linear":
        return linear_regression(x);
      case "quadratic":
        return quadratic_regression(x);
      default:
        return cubic_regression(x);
    }
  }
  
  float linear_regression(float x) { 
    return m * x + b; 
  }
  
  float quadratic_regression(float x) {
    return a * pow(x, 2) + m * x + b;
  }
  
  float cubic_regression(float x) {
    return a * pow(x, 3) + m * x + b;
  }
}
