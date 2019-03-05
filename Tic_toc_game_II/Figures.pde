class Figures{

  int x;
  int y;
  int w;
  int h;
  int state;
  
  
Figures(int tempX, int tempY, int tempW, int tempH){
  x=tempX;
  y=tempY;
  w=tempW;
  h=tempH;
  state = 0;
  
}

void click(float mx,float my){
if (x<mx && mx<x+w && y<my && my<y+w){
state = (state+1) % 3;

}
}

void display(){

stroke(0);
fill(255);
rect(x, y, w, h);

if (state == 1){
ellipse(x+w/2, y+h/2,w-10, h-10);
}

if (state == 2){
line(x+10, y+10, x+w-10,y+h-10);
line(x+10, y+h-10, x+w-10,y+10);
}
}
}



  
  
  
