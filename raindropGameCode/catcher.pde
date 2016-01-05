class Bucket { //declare new class for catching raindrops
  PVector loc;
  int diam;
  PImage s; 
  float c, d; //control size of image

  Bucket () { //create constructor
    s = loadImage("snowman.png"); 
    loc = new PVector (random(width), random(height));
    imageMode(CENTER); //centers image
  }

  void display (float c, float d) { //function display bucket
    image (s, loc.x, loc.y, c, d);
  }

  void update () {
    loc.set(mouseX, mouseY); //makes loc = mouse
  }
  
  void decrease (float a){ //function to decrease size of img
    float c = 250; 
    float d = 278; 
    image(s, loc.x, loc.y, c, d);
    c -= a; 
    d -= a; 
  }
}
