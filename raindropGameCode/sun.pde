class Sun { //declare new class for catching raindrops
  PVector loc, vel;
  PImage s; 
  float c, d; //control size of image

  Sun () { //create constructor
    s = loadImage("sun.png"); 
    loc = new PVector (random(width), 100);
    vel = new PVector (random(-10, 10), 0); 
    imageMode(CENTER); //centers image
    c = 250;
    d = 200;
  }

  void display () { //function display bucket
    image (s, loc.x, loc.y, c, d);
    loc.add(vel); //give sun velocity
    if (loc.x + c/2 >= width) { //if sun passes off screen
      vel.mult(-1); //reverse direction
    }
    if (loc.x - c/2 <= 0) {
      vel.mult(-1);
    }
  }
}