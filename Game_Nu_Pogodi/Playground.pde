class Playground{

float x;
float y;
float h;
float w;



Playground(float tw, float th){

w=tw;
h=th;
x = 0;
y =0;

}
void display(){

strokeWeight(10);
stroke(185, 50, 50);
line(x, h/4, x+w/4, h/4+h/8);
line(x, h/2, x+w/4, h/2+h/8);
line(x+w, h/4, x+w-w/4, h/4+h/8);
line(x+w, h/2, x+w-w/4, h/2+h/8);
}

}
