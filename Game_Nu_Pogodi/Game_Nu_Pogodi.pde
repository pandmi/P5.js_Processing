/*
Egs and Wulf

1. Idea

Algo - from 4 points comming with different speed egs, wuld should hint them, if he miss it - game over. Score counter. 

2. Parts


a. Playground
   create 4 lines   


b. Moving egs 
   b1. create balls which are coming with diff speed in one direction.
   b2. balls should come from random direction (4).
   b3. changing direction after reaching specific X coordinate (end of the line).
   b4. after the reach the end of the line they should fall with higher speed. 
   b5. as the ball reach background - game over.
   b6. create an algorithm to change the speed

c. Create a catcher
   c1. create a ellipse controlled by mouse
   c2. create a intersection algorythm
   c3. create a realistic figure cntrolled by keyboard

d. create a score
   


3. Integration
*/

Playground myPlayground;
Egg [] myEgg;
Wolf myWolf;
Timer limitTime;
int totalEggs=0;
PFont f;
boolean gameOver = false;
int score=0;
color c=color(155);

void setup(){
size(700, 400);
myPlayground = new Playground(width, height);
f = createFont("Arial", 12, true); // A font to write text on the screen
myWolf= new Wolf(40);
limitTime = new Timer(300);
myEgg = new Egg[3000];


}

void draw(){
  
  if (gameOver) {
    textFont(f, 98);
    textAlign(CENTER);
    fill(255);
    text("GAME OVER", width/2, height/2);
  } else {
background (c);
myPlayground.display();
//myWolf.setLocation(mouseX, mouseY);
myWolf.joystick();
myWolf.display();

if (limitTime.isFinished()){

myEgg[totalEggs] = new Egg();
totalEggs++;

  if (totalEggs >= myEgg.length) {
    totalEggs = 0; //Start over
  }

limitTime.start();
}


for(int i=0; i<totalEggs; i++){
if (!myEgg[i].finished) {
myEgg[i].display();
myEgg[i].move();
if (myEgg[i].reachedBottom()) {
     myEgg[i].finished();
     background(80);
     gameOver=true;   
     println("Game over"); 
  }

if (myWolf.intersect(myEgg[i])) { 
      //myEgg[i].highlight();
    myEgg[i].finished();
    score++;
    c= color(random(250),random(250),random(250));
}
}
}
 textFont(f, 20);
    fill(255);
    text("Score: " + score, width-100, 30);

}
}
