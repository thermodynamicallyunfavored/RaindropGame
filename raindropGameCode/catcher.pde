class Bucket { //declare new class for catching raindrops
  PVector loc;
  PImage s; 
  float c, d; //control size of image

  Bucket () { //create constructor
    s = loadImage("snowman.png"); 
    loc = new PVector (random(width), random(height));
    imageMode(CENTER); //centers image
    c = 250;
    d = 278;
  }

  void display () { //function display bucket
    image (s, loc.x, loc.y, c, d);
  }

  void update () {
    loc.set(mouseX, mouseY); //makes loc = mouse
  }

  void decrease (float a) { //function to decrease size of img
    c = c- a;  
    d = d - a;
  }
}
