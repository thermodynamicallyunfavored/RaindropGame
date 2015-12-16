class Bucket { //declare new class for catching raindrops
  PVector loc;
  int diam;
  color c; 

  Bucket (int tdiam) { //create constructor
    diam = tdiam; //make size of bucket changeable
    c = color (242, 81, 56);
    loc = new PVector (random(width), random(height));
  }

  void display () { //function display bucket
    fill(c); //makes bucket red
    ellipse (loc.x, loc.y, diam, diam);
  }
  void update () {
    loc.set(mouseX, mouseY);
  }
}