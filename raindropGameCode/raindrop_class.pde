class Raindrop { //create class for raindrop
  PVector loc, vel, g; //location for raindrop
  int diam ; //diameter for raindrop
  color c; //color for raindrop

  Raindrop () {
    diam = 60; //diameter is 20
    loc = new PVector(random(diam, width-diam), random(diam, height-diam));
    c = color(208, 237, 247); //makes raindrop blue
    vel = PVector.random2D(); //velocity with random magnitude of 1
    vel.mult(random(2, 7)); //multiplies velocity
    g = new PVector (0.1, 0.2); //acceleration of 0,2
  }
  Raindrop (float x, float y) {
    diam = 40; //diameter is 20
    loc = new PVector(x, y);
    c = color(208, 237, 247); //makes raindrop blue
    vel = PVector.random2D(); //velocity with random magnitude of 1
    vel.mult(random(2, 7)); //multiplies velocity
    g = new PVector (0, 0.2); //acceleration of 0,2
  }

  void display () {
    fill(c); //makes raindrop blue
    noStroke(); //no stroke
    ellipse(loc.x, loc.y, diam, diam); //creates raindrop
  }

  void fall() {
    loc.add(vel); //gives raindrop velocity
    vel.add(g); // add gravity
  }
  void reset () {
    loc.y = 0; //brings raindrop back to top of screen
    loc.x = random(diam/2, width - diam/2); //resets raindrop in x direction 
    vel.x = 0; 
    vel.y = 0; //this way raindrop wont speed up
  }
  boolean isInContactWith(PVector x) {
    if (dist(loc.x, loc.y, mouseX, mouseY) < diam/2) { //if mouse is in raindrop
      return true;
    } else {
      return false;
    }
  }
}