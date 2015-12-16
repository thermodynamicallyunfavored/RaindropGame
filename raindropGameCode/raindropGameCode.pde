int count = 1000; //to make arrays, declare count and initialize

Raindrop [] r = new Raindrop [count]; //array of raindrops
Bucket b; //make bucket catcher


PVector mouse;   //declare a P
//Raindrop r;      //declare a new Raindrop called r

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  for (int i = 0; i < count; i ++) {
    r [i] = new Raindrop(random(width), random(-height, 0));   //Initialize r. The parameters used are the initial x and y positions
  }
  b = new Bucket(200); //bucket with diameter of 20
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  b.display(); 
  b.update(); 
  for (int i = 0; i < count; i ++) {
    r[i].fall();         //make the r fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();      //display the raindrop
    if (r[i].isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset();                         //if it is, reset the raindrop
      println("Touched the raindrop!   Resetting....");
    }
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset the raindrop
      println("You can't catch me, I'm the gingerbread raindrop!   Resetting....");
    }
    if (r[i].loc.x < r[i].diam/2) {
      r[i].reset();
      println("Your raindrop ran away   :(    Resetting....");
    }
  }
}