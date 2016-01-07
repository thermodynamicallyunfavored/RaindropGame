ArrayList<Raindrop> rds = new ArrayList <Raindrop>(); //make array list

Bucket b; //make bucket catcher
Sun melt; 


PVector mouse;   //declare a Pvector mouse

int s = 0; //declare + intialize s = score
int count = 0; //counts number of raindrops in bucket
int gamemode = 0; //variabl efor game mode



void setup() {
  size(1200, 800); //set size of screen
  mouse = new PVector();  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  rds.add(new Raindrop(random(width), random(-height, 0))); //add raindrops to arraylist
  b = new Bucket(); //bucket with diameter of 100
  melt = new Sun(); 
  textAlign(CENTER); //centers text
}



void draw () {
  if (gamemode == 0) { //if game mode is 0 , show start screen
    startscreen();
  } else if (gamemode ==1) {
    playgame(); //starts game
  } else if (gamemode == 2) { //if gamemmode is 2, game over screen
    losescreen();
  } else if (gamemode == 3) { //if gamemode is 3, you win screen
    winscreen();
  }
}

void startscreen() {
  background(0, 200, 255); //bg color
  textSize(100); 
  fill(255); 
  text("Snowman", width/2, 350); //beginning info and such
  textSize(20); 
  text("The goal of this game is to make Frosty as big as possible by collecting snowballs.", width/2, height/2); 
  text("Press 'SHIFT' to start", width/2, 430);
}

void winscreen() {
  background(0, 200, 255); //bg color
  textSize(50); 
  text("YOU WIN", width/2, height/2); //you win
  textSize(30); 
  text("Press 'Shift' to restart game", width/2, 450);
}

void losescreen() {
  background(0, 200, 255); //bg color
  textSize(50); 
  text("GAME OVER", width/2, height/2); //game over
  textSize(30); 
  text("Press 'Shift' to restart game", width/2, 450);
}


void playgame() { //playgame funcion
  println(rds.size()); //check size of array list

  background(0, 200, 255); //bg color

  mouse.set(mouseX, mouseY);   //set value of mouse as mouseX,mouseY
  fill(255); //make scoreboard white
  rect(1100, 700, 1200, 800); //draw scoreboard
  fill(242, 81, 56); //score color
  textSize(30); //change text size
  text(s, 1150, 750); //displays score

  melt.display(); //displays sun

  for (int i = 0; i < 40; i++) { //start w/ 40 snowballs
    rds.add(new Raindrop(random(width), random(-height, 0))); //add new snowballs to array list
  }

  b.update(); //updates b.loc as mouse
  b.display(); //display bucket

  for (int i= rds.size() - 1; i >= 0; i --) {
    Raindrop r = rds.get(i); //getting item in array rds at index i
    r.display(); //displays raindrop
    r.fall(); //raindrops will fall


    if (r.melts(melt)) { //if sun touches snowball 
      rds.remove(i); // remove snowball
    }

    if (r.isInContactWith(b)) { //if a raindrop is in contact with the bucket
      rds.remove(i); //remove raindrop
      count++; //increase count each time bucket touches raindrop

      if (count >= 100) {
        s++; //increase score
        count = 0; //reset count to 0
        b.decrease(-15); //increases size of snowman
      } 

      if (count <= 500 && s >= 5) { //if the bucket has caught < 199 raindrops and score is > 5
        b.decrease(.65); //decreases size of snowman
      }

      if (r.loc.y > height) { //if randrop hits the bottom of the screen
        rds.remove(i); //remove raindrop
        rds.clear(); //clears out arraylist
      }
    }
  }
  if (b.c <= 50) { //if snowman's width < 50 
    gamemode = 2; //game over screen
  }

  if (s == 10 || b.c > 600) { //if score gets to 10
    gamemode = 3; //you win screen
  }
}

void keyPressed() {
  if (keyCode == SHIFT) {
    if (gamemode == 0) {
      gamemode = 1; //game mode changes
      rds.clear(); //clear arraylist
    } else if (gamemode == 2) {
      gamemode = 1; //game mode changes
      rds.clear(); //clear arraylist
    } else if (gamemode == 3) {
      gamemode = 1; //game mode changes
      rds.clear(); //clear arraylist
    }
  }
}