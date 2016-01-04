ArrayList<Raindrop> rds = new ArrayList <Raindrop>(); //make array list

Bucket b; //make bucket catcher


PVector mouse;   //declare a P
//Raindrop r;      //declare a new Raindrop called r




void setup() {
  size(1200, 800); //set size of screen
  mouse = new PVector();  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  rds.add(new Raindrop(random(width), random(-height, 0)));
  b = new Bucket(200); //bucket with diameter of 20
}

void draw() {
  println(rds.size());
  mouse.set(mouseX, mouseY);   //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  for (int i = 0; i < 40; i++) {
    rds.add(new Raindrop(random(width), random(-height, 0)));
  }
  b.update(); 
  for (int i= rds.size() - 1; i >= 0; i --) {
    Raindrop r = rds.get(i); 
    r.display(); 
    r.fall(); 
    if (r.isInContactWith(b)) { //if a raindrop is in contact with the bucket
      rds.remove(i); //remove raindrop
    }
    if (r.loc.y > height) { //if randrop hits the bottom of the screen
      rds.remove(i); //remove raindrop
    }
  }

  b.display();
}