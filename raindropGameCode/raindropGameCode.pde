ArrayList<Raindrop> rds = new ArrayList <Raindrop>(); //make array list

Bucket b; //make bucket catcher


PVector mouse;   //declare a Pvector mouse

PImage sun; //declare pimage


int s = 0; //declare + intialize s = score
int count = 0; //counts number of raindrops in bucket

void setup() {
  size(1200, 800); //set size of screen
  mouse = new PVector();  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  rds.add(new Raindrop(random(width), random(-height, 0)));
  b = new Bucket(); //bucket with diameter of 100
  sun = loadImage("sun.png"); //loads sun image
  textAlign(CENTER); //centers text
}

void draw() {
  println(rds.size());

  background(0, 200, 255); //bg color

  mouse.set(mouseX, mouseY);   //set value of mouse as mouseX,mouseY
  fill(255); //make scoreboard white
  rect(1100, 700, 1200, 800); //draw scoreboard
  fill(242, 81, 56); //score color
  textSize(30); //change text size
  text(s, 1150, 750); //displays score

  for (int i = 0; i < 40; i++) {
    rds.add(new Raindrop(random(width), random(-height, 0)));
  }

  b.update(); //updates b.loc as mouse
  b.display(250, 278); //display bucket

  for (int i= rds.size() - 1; i >= 0; i --) {
    Raindrop r = rds.get(i); //getting item in array rds at index i
    r.display(); //displays raindrop
    r.fall(); //raindrops will fall

    if (r.isInContactWith(b)) { //if a raindrop is in contact with the bucket
      rds.remove(i); //remove raindrop
      count++; //increase count each time bucket touches raindrop
      r.diam += 5; //increase diam of raindrop

      if (count >= 500) {
        s++; //increase score
        count = 0; //reset count to 0
        b.decrease(-10); //increase the bucket's diameter by 5
      } 

      if (count <= 400 && s >= 5) { //if the bucket has caught < 199 raindrops and score is > 5
        b.decrease(100);
      }

      if (r.loc.y > height) { //if randrop hits the bottom of the screen
        rds.remove(i); //remove raindrop
      }
    }

    /*if (b.diam <= 10) { //if bucket's diameter < 10 
     background(0, 200, 255); //bg color
     textSize(50); 
     text("GAME OVER", width/2, height/2); //game over
     textSize(30);
     }*/

    if (s >= 10) {
      background(0, 200, 255); //bg color
      textSize(50); 
      text("YOU WIN", width/2, height/2); //you win
    }
  }
