class Egg{

float xspeed;
float yspeed;
float xe;
float ye;
boolean turn = false;
float r;
color c;
int eggPosition;

boolean finished = false;



Egg(){
c=color(255);
eggPosition = int(random(4));
yspeed = 0.125;

if (eggPosition==0) {
ye=height/4;
xe = 0;
xspeed = 0.5;
}
if (eggPosition==1) {
ye=height/2;
xe = 0;
xspeed = 0.5;
}
if (eggPosition==2) {
ye=height/4;
xe = width;
xspeed = -0.5;
}
if (eggPosition==3) {
ye=height/2;
xe = width;
xspeed = -0.5;
}

r=20;

}

void move(){ 

xe += xspeed; 
ye += yspeed;


if (eggPosition==0&&xe > width/4 && xe < width -width/4 ) {
xspeed  -= 0.001;
xspeed = constrain(xspeed, 0, 5);
yspeed = 0.5;
}

if (eggPosition==1&&xe > width/4 && xe < width -width/4 ) {
xspeed  -= 0.001;
xspeed = constrain(xspeed, 0, 5);
yspeed = 0.5;
}


if (eggPosition==2 &&xe > width/4 && xe < width -width/4 ) {
xspeed  += 0.001;
//xspeed = constrain(xspeed, 0, 5);
yspeed = 0.5;

}
    
if (eggPosition==3 &&xe > width/4 && xe < width -width/4 ) {
xspeed  += 0.001;
//xspeed = constrain(xspeed, 0, 5);
yspeed = 0.5;

}    
    
if (ye > height) {
ye =height+r*5; 
yspeed = 0;
}
}

void display(){
noStroke();
fill(c);

for (int i = 12; i < r; i++) {
ellipse(xe, ye - r*1.5 + i*1, i*1, i*1);
}
}




void highlight() { 
  c = color(0, 150);
  yspeed=0;
  xspeed=0;
  ye=-1000;
  
  }


boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (ye > height + r*4) { 
      return true;
    } else {
      return false;
    }
}

  void finished() {
    finished = true;
  }
}
