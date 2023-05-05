void setup(){
  size(600,600);
  //noLoop();
  
}

void draw(){
  PImage img = loadImage("aviao2.jpg");
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
      if(red(out.pixels[pos]) > 210 && y > 100 && x > 100 && y < 540 ) out.pixels[pos] = color(255);
      else out.pixels[pos] = color(0);
      
    }
  } 
  image(out,0,0);
  stroke(255,0,0);
  strokeWeight(1);
  line(0,100,600,100);
  line(80,100,80,600);
  line(560,100,560,600);
  line(80,545,600,545);
  line(310,545,430,516);
  fill(255,255,0);
  textSize(20);
  text(mouseX + " " + mouseY, mouseX, mouseY);
  //save("PBlimiarização.jpg");
}
