void setup(){
  size(640,427);
}
void draw(){
  PImage img = loadImage("AviaoGTOriginal.jpg");
  PImage out = createImage(img.width, img.height, RGB);
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      int media = (int) (blue(img.pixels[pos]));
      out.pixels[pos] = color(media);
    }
  }
   for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      int intensidade = (int) red(out.pixels[pos]) + 100;
      if(intensidade > 255) intensidade = 255;
      else if(intensidade < 0) intensidade = 0;
      out.pixels[pos] = color(intensidade);
    }
  } 
   for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      if(red(out.pixels[pos]) > 210 && y > 0 && x > 0 && y < 500 ) out.pixels[pos] = color(0);
      else out.pixels[pos] = color(255);
      
    }
  } 
  image(out,0,0);
  save("aviaolimiarização.jpg");
}
