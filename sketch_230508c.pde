PImage img; 
PImage outputImg; 
void setup() {
  size(640, 427);
  img = loadImage("aviao.jpg");
  outputImg = createImage(img.width, img.height, RGB);
  outputImg.loadPixels();
  sobelFilter();
  image(img, 0, 0);
  image(outputImg, img.width, 0);
}
void sobelFilter() {
  int[][] sobelX = { {-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1} }; 
  int[][] sobelY = { {-1, -2, -1}, {0, 0, 0}, {1, 2, 1} };
  for (int x = 1; x < img.width - 1; x++) {
    for (int y = 1; y < img.height - 1; y++) {
      float sumX = 0;
      float sumY = 0;
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          int loc = (x + i) + (y + j) * img.width;
          float pixelValue = brightness(img.pixels[loc]); 
          sumX += sobelX[i + 1][j + 1] * pixelValue;
          sumY += sobelY[i + 1][j + 1] * pixelValue;
        }
      }
      float magnitude = sqrt(sumX * sumX + sumY * sumY);
      int loc = x + y * img.width;
      outputImg.pixels[loc] = color(magnitude);
    }
  }
  outputImg.updatePixels();
 outputImg.save("aviaosobel.jpg");

}
