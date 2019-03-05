Figures[][] board;

int colls = 3;
int rows = 3;



void setup(){
size(600, 600);

int w= width/colls;
int h = height/rows;

board = new Figures[colls][rows];
for (int i=0; i <board.length; i++){
  for(int j=0; j <board.length; j++){
    board[i][j] = new Figures(i*w, j*h, w, h);

}
}
}


void draw(){
for (int i=0; i <board.length; i++){
for(int j=0; j <board.length; j++){
  board[i][j].display();
}
}
 }

void mousePressed(){
for (int i=0; i <board.length; i++){
for(int j=0; j <board.length; j++){
  board[i][j].click(mouseX, mouseY);
} 
}
}
