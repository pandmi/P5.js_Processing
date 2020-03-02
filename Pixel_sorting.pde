PImage img;
PImage sorted;

void setup() {
  size(516, 200);
  
  img = loadImage("foto_13.jpg");
  sorted = img.get();
  sorted.loadPixels();

  // Selection sort!
  for (int i = 0; i < sorted.pixels.length; i++) {
    float record = -1;
    int selectedPixel = i;
    for (int j = i; j < sorted.pixels.length; j++) {
      color pix = sorted.pixels[j];
      // Sort by hue
      float b = hue(pix);
      if (b > record) {
        selectedPixel = j;
        record = b;
      }
    }

    // Swap selectedPixel with i
    color temp = sorted.pixels[i];
    sorted.pixels[i] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;
  }

  sorted.updatePixels();
}

void draw() {
  background(0);
   image(sorted, 0, 0);
   image(img, 258, 0);
   save("cross.tga");

}

void keyPressed(){
  if (key == 'c'){
      saveFrame("test" + frameCount + ".jpg"); 
  }
  if (key == 's'){
    saveFrame("test" + frameCount + ".jpg"); 
  }
}
