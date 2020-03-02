int kareBoyutu = 22;
int yatayKareSayisi, dikeyKareSayisi;
int yatayGenislikY, dikeyGenislikY;

int[][] dolular;

int sayac;
int sayacMax = 16;

Parca mParca;

boolean bitti = false;

void setup() {
  size(1600,900,P2D);
  yatayKareSayisi = 12;
  dikeyKareSayisi = 28;
  
  yatayGenislikY = (1600 / 2) 
    - ((yatayKareSayisi * kareBoyutu) / 2);
  
  dikeyGenislikY = (900 / 2)
    - ((dikeyKareSayisi * kareBoyutu) / 2);
    
  dolular = new int[yatayKareSayisi][dikeyKareSayisi];
  
  for(int i = 0; i < yatayKareSayisi; i++) {
    for(int j = 0; j < dikeyKareSayisi; j++) {
      dolular[i][j] = -1;
    }
  }
}

void hatSilKont(int y) {
  boolean silinecekMi = true;
 
  for(int i = 0; i < yatayKareSayisi; i++) {
    if(i >= 0 && y >= 0 && i < yatayKareSayisi && y < dikeyKareSayisi) {
      if(dolular[i][y] == -1) {
        silinecekMi = false;
        return;
      }
    }
  }
  
  if(silinecekMi) {
    fill(#90FFA3);
    for(int i = 0; i < yatayKareSayisi; i++) {
      if(i >= 0 && y >= 0 && i < yatayKareSayisi && y < dikeyKareSayisi) {
        dolular[i][y] = -1;
         rect(yatayGenislikY + i * kareBoyutu,
               dikeyGenislikY + y * kareBoyutu,
               kareBoyutu,kareBoyutu);
      }
    }
    
    for(int i = 0; i < yatayKareSayisi; i++) {
      for(int j = y; j >= 0; j--) {
        if(dolular[i][j] == 1) {
          dolular[i][j] = -1;
          dolular[i][j+1] = 1;
        }
      }
    }
  }
}

void rastParca() {
  if(mParca != null) {
    mParca.dolularaEkle();
  }
  int r = int(random(0,5));
  mParca = new Parca(yatayKareSayisi/2,0,r);
}

void keyPressed() {
  if (keyCode == LEFT) {
    if(mParca != null) {
      kayYon = -1;
    }
  } else if (keyCode == RIGHT) {
    if(mParca != null) {
      kayYon = 1;
    }
  } else if (keyCode == UP) {
    if(mParca != null) {
      kayYon = 2;
    }
  }  
}

boolean ilerleAni;
int kayYon = 0;

void draw() {
  
  if(bitti) {
    background(#985E6D);
    return;
  }
  // zamanı yavaşlatmak için
  sayac++;
  
  if(sayac > sayacMax || (keyPressed && keyCode == DOWN)){
    sayac = 0;
    ilerleAni = true;
  } else {
    ilerleAni = false;
  }
  
  background(0);
  
  for(int i = 0; i < yatayKareSayisi; i++) {
    for(int j = 0; j < dikeyKareSayisi; j++) {
      if(dolular[i][j] == -1) {
        fill(40);
      } else if(dolular[i][j] == 1) {
        fill(#D88585);
      }
      rect(yatayGenislikY + i * kareBoyutu,
          dikeyGenislikY + j * kareBoyutu,
          kareBoyutu,kareBoyutu);
    }
  }

  if(mParca != null) {
    if(kayYon != 0) {
      mParca.kaydir(kayYon);
      kayYon = 0;
    }
  }

  if(ilerleAni) {
    if(mParca != null) {
      // hareketli parçayı yürüt
      if(mParca.ilerle()) {

      } else {
        rastParca();
        for(int i = 0; i < dikeyKareSayisi; i++) {
          hatSilKont(i);
        }
      } 
    } else {
      rastParca();
    }
  }

  
  
  if(mParca != null) {
    mParca.ciz();
  }
}

class Parca {
  
  int[] xler;
  int[] yler;
  int kacKare;
  int cev;
  
  public Parca(int basX, int basY, int tur){
    cev = 0;
    
    if(tur == 0) {
      kareParca(basX,basY);
    } else if(tur == 1) {
      lParca(basX,basY);
    } else if(tur == 2) {
      iParca(basX,basY);
    } else if(tur == 3) {
      tParca(basX,basY);
    } else if(tur == 4) {
      zParca(basX,basY);
    } 
  }
  
  void kaydir( int yon ) {
    if(yon == 0) {
      return;
    } else if(yon == 1) {
      boolean ilerlicekMi = true;
    
      for(int i = 0; i < kacKare; i++){
        int x = xler[i] + 1;
        int y = yler[i];
        
        if(x >= 0 &&  y >= 0 && x < yatayKareSayisi && y < dikeyKareSayisi) {
          if(dolular[x][y] != -1) {
            ilerlicekMi = false;
          }
        } else if( x == yatayKareSayisi) {
          ilerlicekMi = false;
        }
      }
      
      if(ilerlicekMi) {
        for(int i = 0; i < kacKare; i++){
          xler[i] += 1;
        }
      }
      
    } else if(yon == -1) {
      boolean ilerlicekMi = true;
    
      for(int i = 0; i < kacKare; i++){
        int x = xler[i] - 1;
        int y = yler[i];
        
        if(x >= 0 &&  y >= 0 && x < yatayKareSayisi && y < dikeyKareSayisi) {
          if(dolular[x][y] != -1) {
            ilerlicekMi = false;
          }
        } else if( x == -1 ) {
          ilerlicekMi = false;
        }
      }
      
      if(ilerlicekMi) {
        for(int i = 0; i < kacKare; i++){
          xler[i] -= 1;
        }
      }
    } else if(yon == 2) {
        cevir();
    }
  }
  
  boolean ilerle() {
    boolean ilerlicekMi = true;
    
    for(int i = 0; i < kacKare; i++){
      int x = xler[i];
      int y = yler[i] + 1;
      
      if(x >= 0 &&  y >= 0 && x < yatayKareSayisi && y < dikeyKareSayisi) {
        if(dolular[x][y] != -1) {
          ilerlicekMi = false;
        }
      } else if( y == dikeyKareSayisi) {
        ilerlicekMi = false;
      }
    }
    
    if(!ilerlicekMi) {
        return false;
    }

    for(int i = 0; i < kacKare; i++){
      yler[i] += 1;
    }
    
    return true;
  }

  void kareParca(int basX, int basY) {
    kacKare = 4;
    
    xler = new int[kacKare];
    yler = new int[kacKare];
    
    xler[0] = basX;
    yler[0] = basY;
    
    xler[1] = basX+1;
    yler[1] = basY;
    
    xler[2] = basX;
    yler[2] = basY+1;
    
    xler[3] = basX+1;
    yler[3] = basY+1;
  }
  
  void zParca(int basX, int basY) {
    kacKare = 4;
    
    xler = new int[kacKare];
    yler = new int[kacKare];
    
    xler[0] = basX;
    yler[0] = basY;
    
    xler[1] = basX+1;
    yler[1] = basY;
    
    xler[2] = basX+1;
    yler[2] = basY+1;
    
    xler[3] = basX+2;
    yler[3] = basY+1;
  }
  
  
  void lParca(int basX, int basY) {
    kacKare = 4;
    
    xler = new int[kacKare];
    yler = new int[kacKare];
    
    xler[0] = basX;
    yler[0] = basY-1;
    
    xler[1] = basX+1;
    yler[1] = basY-1;
    
    xler[2] = basX+1;
    yler[2] = basY;
    
    xler[3] = basX+1;
    yler[3] = basY+1;
  }
  
  void iParca(int basX, int basY) {
    kacKare = 4;
    
    xler = new int[kacKare];
    yler = new int[kacKare];
    
    xler[0] = basX;
    yler[0] = basY;
    
    xler[1] = basX;
    yler[1] = basY-1;
    
    xler[2] = basX;
    yler[2] = basY+2;
    
    xler[3] = basX;
    yler[3] = basY+1;
  }
  
   void tParca(int basX, int basY) {
    kacKare = 4;
    
    xler = new int[kacKare];
    yler = new int[kacKare];
    
    xler[0] = basX;
    yler[0] = basY;
    
    xler[1] = basX;
    yler[1] = basY+1;
    
    xler[2] = basX+1;
    yler[2] = basY+1;
    
    xler[3] = basX-1;
    yler[3] = basY+1;
  }

  void dolularaEkle() {
    for(int i = 0; i < kacKare; i++){
      if(xler[i] >= 0 && xler[i] < yatayKareSayisi && yler[i] >= 0 && yler[i] < dikeyKareSayisi) {
        dolular[xler[i]][yler[i]] = 1;
      } else {
        // oyun bitti
        bitti = true;
      }
    }
  }
  
  void cevir() {
    int x = xler[0];
    int y = yler[0];
    
    boolean cevirlirMi = true;
    
    for(int i = 0; i < kacKare; i++){
      int xf = xler[i] - x;
      int yf = yler[i] - y;

      if(x + yf < 0 || x + yf >= yatayKareSayisi || y - xf < 0 || y - xf >= dikeyKareSayisi) {
        cevirlirMi = false;
      }
    }
    
    if(cevirlirMi) {
      for(int i = 0; i < kacKare; i++){
        int xf = xler[i] - x;
        int yf = yler[i] - y;
        xler[i] = x + yf;
        yler[i] = y - xf;   
      } 
    }
  }
  
  void ciz() {
    fill(#124685);
    
    for(int i = 0; i < kacKare; i++){
      rect(yatayGenislikY + xler[i] * kareBoyutu,
            dikeyGenislikY + yler[i] * kareBoyutu,
            kareBoyutu,kareBoyutu);
    }
  }
}
