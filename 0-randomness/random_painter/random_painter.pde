/*
Pixabay: neelam279 (Frauke Riether)
Image: flower-8559381.jpg

Pixabay: Arduinna
Image: bird-8037744.jpg

Pixabay: Netti_Nu_Nu (Aneta Rog)
Image: bird-8132549.jpg

Pixabay: Level_Up_Filming (Jason)
Image: butterfly-7949342.jpg

Pixabay: geralt (Gerd Altmann)
Image: colorful-3256055.jpg
*/

class Pic {
  String name;
  String filepath;
  PImage image;
  float x, y;
  
  Pic(String name, String path, float x, float y) {
    this.name = name;
    filepath = path;
    this.x = x;
    this.y = y;
  }
  
  void load() {
    image = loadImage(filepath);
    image.loadPixels();
    println(filepath);
  }
  
  void paint() {
    int a = floor(random(400));
    int b = floor(random(400));
    int i = floor((a + x * (width - 400)) * (b + y * (height - 400)));
    
    int size = floor(random(20)) + 1;
    
    color c = image.pixels[i];
    noStroke();
    fill(c);
    circle(a, b, size);
    
    
  }
}

Pic[] pics = new Pic[5];
Pic active;

void setup() {
  size(400, 400);
  
  pics[0] = new Pic("Flower", "flower-8559381.jpg", 0.0, 1.0);
  pics[1] = new Pic("Abstract", "colorful-3256055.jpg", 0.5, 0.5);
  pics[2] = new Pic("Butterfly", "butterfly-7949342.jpg", 0.5, 0.5);
  pics[3] = new Pic("Blackbird", "bird-8132549.jpg", 1.0, 1.0);
  pics[4] = new Pic("Finch", "bird-8037744.jpg", 0.5, 1.0);
  
  set_image();
}

void draw() {
  active.paint();
}

void set_image() {
  int use_image = floor(random(5));
  active = pics[use_image];
  active.load();
}
