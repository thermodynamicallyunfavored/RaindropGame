class Raindrop { //create class for raindrop
  PVector loc, vel, g; //location for raindrop
  int diam ; //diameter for raindrop
  color c; //color for raindrop


  Raindrop (float x, float y) {
    diam = 20; //diameter is 20
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
  boolean isInContactWith(Bucket b) {
    if (loc.dist(b.loc) < diam/2 + b.loc.y*.3) { //if distance between mouse and snowball is less than the snowball's raidus and image's height/3
      return true;
    } else {
      return false;
    }
  }
  boolean melts (Sun m) { //function melt snowballs
    if (loc.dist(m.loc) < diam/2 + m.loc.x/4) { //if distance is less than the diameter of the snowball + width of image/4
      return true; //then return true
    } else { //otherwise
      return false; //otherwise return false
    }
  }
}