class Sun { //declare new class for catching raindrops
  PVector loc, vel;
  PImage s; 
  float c, d; //control size of image

  Sun () { //create constructor
    s = loadImage("sun.png"); 
    loc = new PVector (random(width), 100);
    vel = new PVector (random(-10, 10), 0); 
    imageMode(CENTER); //centers image
    c = 250; //width
    d = 200; //height
  }

  void display () { //function display bucket
    image (s, loc.x, loc.y, c, d);
    loc.add(vel); //give sun velocity
    if (loc.x + c/2 >= width) { //if sun passes off right side of screen
      vel.mult(-1); //reverse direction
    }
    if (loc.x - c/2 <= 0) { //if sun passes off left side of screen
      vel.mult(-1); //reverse direction 
    }
  }
}