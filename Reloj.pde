//https://processing.org/examples/clock.html 
float sR;

void setup() {
  size(500, 500);
  int r = min(width, height) / 2;
  float sR = r * 0.72;
}

void draw() {
  background(0);
  /*translate(200, 200);
  rotate(-HALF_PI);
  */
  int h = height;
  int w = width;
  int hr = hour();
  int mn = minute();
  int sc = second();
  int grosor = 12;
  float angSeg = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  
  
  fill(255);
  noStroke();
  textSize(12);
  text(hr + ":" + mn + ":" + sc, 0, 12);

  textSize(32);
  text("12", (w/2)-32, 32);
  text("6", (w/2)-20, h-6);
  text("9", 6, h/2);
  text("3", w-28, h/2);

  strokeWeight(grosor);
  rect(w/2-16, 32+5, grosor, grosor);
  rect(w/2-16, h-46, grosor, grosor);
  rect(32, h/2-17, grosor, grosor);
  rect(w-42, h/2-17, grosor, grosor);
  
  pushMatrix();
  stroke(255, 255, 255);
  line(w/2, h/2, w/2 + cos(angSeg) * sR, h/2 + sin(angSeg) * sR);
  popMatrix();
}
