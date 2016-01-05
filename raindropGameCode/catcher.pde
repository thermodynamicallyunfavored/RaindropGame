class Bucket { //declare new class for catching raindrops
  PVector loc;
  int diam;
  PImage s; 
  color c; 

  Bucket (int tdiam) { //create constructor
    diam = tdiam; //make size of bucket changeable
    c = color (242, 81, 56);
    s = loadImage("snowman.png"); 
    loc = new PVector (random(width), random(height));
  }

  void display () { //function display bucket
    fill(c); //will replace with snowman.png later, for some reason rn having difficulties
    ellipse (loc.x, loc.y, diam, diam);
  }
  void update () {
    loc.set(mouseX, mouseY); //makes loc = mouse
  }
}
