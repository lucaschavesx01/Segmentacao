PImage img1;
PImage img2;
int acertos = 0;
int falsosPositivos = 0;
int falsosNegativos = 0;

void setup() {
  size(640, 480);
  noLoop();
  img1 = loadImage(".jpg");
  img2 = loadImage("foto2.jpg");
}

void draw() {
  // Obtém a largura e altura das imagens
  int w = img1.width;
  int h = img1.height;
  
  // Percorre todos os pixels de ambas as imagens
  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      // Obtém as cores dos pixels nas coordenadas (x, y)
      color c1 = img1.get(x, y);
      color c2 = img2.get(x, y);
      
      if (c1 == c2) {
        // os pixels são iguais
        acertos++;
      } else {
        // os pixels são diferentes
        boolean c1Branco = brightness(c1) > 127;
        boolean c2Branco = brightness(c2) > 127;
        if (c1Branco && !c2Branco) {
          falsosPositivos++;
        } else if (!c1Branco && c2Branco) {
          falsosNegativos++;
        }
      }  
    }
  }  
  
  // Exibe os resultados
  println("Acertos: " + acertos);
  println("Falsos positivos: " + falsosPositivos);
  println("Falsos negativos: " + falsosNegativos);
  
  // Exibe as imagens
  image(img1, 0, 0);
  image(img2, 300, 0);
}
