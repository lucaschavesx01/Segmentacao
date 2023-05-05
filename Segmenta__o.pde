void setup(){
  size(427,640);
  //noLoop();
 
  
}

void draw(){
  background(0);
  PImage img = loadImage("caneca.jpg");
  PImage out = createImage(img.width, img.height, RGB);
  
  //Filtro escala de cinza
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      int media = (int) (blue(img.pixels[pos]));
      out.pixels[pos] = color(media);
    }
  }
  
  //Filtro de brilho
   for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      int intensidade = (int) red(out.pixels[pos]) + 100;
      if(intensidade > 255) intensidade = 255;
      else if(intensidade < 0) intensidade = 0;
      out.pixels[pos] = color(intensidade);
    }
  } 
  //Filtro de Limiarização
   for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*img.width + x;
      if(blue(out.pixels[pos]) > 235 && y > 100 && x > 90 && y < 700) out.pixels[pos] = color(255);
      if(red(out.pixels[pos]) > 235 && y > 100 && x > 90 && y < 700) out.pixels[pos] = color(255);
      if(green(out.pixels[pos]) > 235 && y > 100 && x > 90 && y < 700) out.pixels[pos] = color(255);
      else out.pixels[pos] = color(0);
      
    }
   }
  image(out,0,0);
  stroke(255,0,0);
  strokeWeight(1);
  line(0,178,640,178);
  line(0,370,640,370);
  line(125,32,125,640);
  line(589,32,589,640);

  fill(255,255,0);
}
