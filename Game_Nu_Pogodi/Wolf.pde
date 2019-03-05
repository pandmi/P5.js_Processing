class Wolf{
int r;
float x;
float y;

Wolf(int tr){
r = tr;
}

void setLocation(float tx, float ty){
x=tx;
y=ty;
}


void joystick(){
  if (keyPressed) {
    if (keyCode == 33) {
     x=width/4;
     y=(height/4+height/8);
    }
       if (keyCode == 37) {
     x=width/4;
     y=(height/2+height/8);
    }
    
        if (keyCode == 34) {
     x=width-width/4;
     y=height/4+height/8;
    }   
      if (keyCode == 39) {
     x=width-width/4;
     y=height/2+height/8;
    }   
    
  } 
}


void display(){
noStroke();
fill(180);
ellipse(x, y, r, r);

}

boolean intersect(Egg myEgg){
  
  float distance = dist(x,y, myEgg.xe, myEgg.ye);
    
  if (distance < r/2+myEgg.r){
  return true;
  }
  else {
  return false;
  }
}
}
