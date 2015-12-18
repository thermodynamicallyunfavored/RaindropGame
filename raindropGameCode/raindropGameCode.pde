//int count = 1000; //to make arrays, declare count and initialize

ArrayList<Raindrop> rds = new ArrayList <Raindrop>(); //make array list

//Raindrop [] r = new Raindrop [count]; //array of raindrops
Bucket b; //make bucket catcher


PVector mouse;   //declare a P
//Raindrop r;      //declare a new Raindrop called r

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  for (int i = 0; i < 1000; i++) { 
    rds.add(new Raindrop(random(width), random(-height, 0)));
  }
  b = new Bucket(200); //bucket with diameter of 20
}

void draw() {
  println(rds.size());
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  rds.add(new Raindrop(random(width), random(-height, 0))); 
  b.update(); 
  for (int i= rds.size() - 1; i >= 0; i --) {
    Raindrop r = rds.get(i); 
    r.display(); 
    r.fall(); 
    if (r.isInContactWith(b)) {
      rds.remove(i);
    }
  }

  b.display();
}