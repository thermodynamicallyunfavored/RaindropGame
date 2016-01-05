class Bucket { //declare new class for catching raindrops
  PVector loc;
  int diam;
  PImage s; 

  Bucket (int tdiam) { //create constructor
    diam = tdiam; //make size of bucket changeable
    s = loadImage("snowman.png"); 
    loc = new PVector (random(width), random(height));
    imageMode(CENTER); //centers image
  }

  void display () { //function display bucket

    image (s, loc.x, loc.y);
  }
  void update () {
    loc.set(mouseX, mouseY); //makes loc = mouse
  }
}
