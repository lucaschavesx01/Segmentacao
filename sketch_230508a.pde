void setup() {
  size(576,362);
  noLoop();
  colorMode(HSB,360,100,100);
}

void draw() {
  PImage img = loadImage("teste.jpeg");
  PImage out = createImage(img.width, img.height, HSB);
  
  for(int y = 0; y < img.height; y++) {
    for(int x = 0; x < img.width; x++) {
      int pos = y*img.width + x;
      int matiz = int(hue(img.pixels[pos]));
      if(matiz > 290) out.pixels[pos] = color(0,0,100);
      else out.pixels[pos] = color(0,100,0);
    }
  }
  
  image(out,0,0);
  save("GToriginal.jpg");
}
