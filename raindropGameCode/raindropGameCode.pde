ArrayList<Raindrop> rds = new ArrayList <Raindrop>(); //make array list

Bucket b; //make bucket catcher


PVector mouse;   //declare a P
//Raindrop r;      //declare a new Raindrop called r


int s = 0; //declare + intialize s = score
int count = 0; //counts number of raindrops in bucket

void setup() {
  size(1200, 800); //set size of screen
  mouse = new PVector();  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  rds.add(new Raindrop(random(width), random(-height, 0)));
  b = new Bucket(200); //bucket with diameter of 100
  textAlign(CENTER);
}

void draw() {
  println(rds.size());
  mouse.set(mouseX, mouseY);   //set value of mouse as mouseX,mouseY
  background(0, 200, 255); //bg color
  fill(255); //make scoreboard white
  rect(1100, 700, 1200, 800); //draw scoreboard
  fill(242, 81, 56); //score color
  textSize(30); //change text size
  text(s, 1150, 750); //displays score

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
      count++; //increase count each time bucket touches raindrop
      if (count >= 200) {
        s++; //increase score
        count = 0; //reset count to 0
        b.diam += 10;
      } 
      if (count <= 150 && s >= 5) { //if the bucket has caught < 150 raindrops and score is > 5
        b.diam -= .001; //decrease the bucket's diameter
      }
      if (b.diam <= 10) {
        background(0, 200, 255); //bg color
        text("GAME OVER", height/2, width/2);
      }
    }
    if (r.loc.y > height) { //if randrop hits the bottom of the screen
      rds.remove(i); //remove raindrop
    }
  }
  b.display(); //display bucket
}