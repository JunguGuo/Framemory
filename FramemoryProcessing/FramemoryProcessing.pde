import gab.opencv.*;

OpenCV opencv;
PImage srcImg;
PImage initImg;
int maxBLUR = 35;
//final int sizeX = 1440/2;
//final int sizeY = 900/2;
void setup() {
  srcImg = loadImage("test.jpg");
  initImg = srcImg.copy();
  

  size(720, 450);


//init setting
initImg.filter(BLUR,maxBLUR);
initImg.filter(GRAY);
//tint(255, 255);  // Apply transparency without changing color
  
//frameRate(20);
}

void draw() {
  smooth();
    
noCursor();
image(initImg, 0, 0);
  // get blur value, get grey value
  float blurVal = map(mouseX,0,width,0,maxBLUR);
  float greyVal = map(mouseY,0,height,255,0);
  
  //blur one copy
  PImage finalImg = srcImg.copy();
  finalImg.filter(BLUR,blurVal);// Larger values increase the blur.
  //finalImg.filter(GRAY);

  tint(255,greyVal);
  image(finalImg, 0, 0);
  
  println(greyVal);
  //blend both according to 'gray value'
  
  
}