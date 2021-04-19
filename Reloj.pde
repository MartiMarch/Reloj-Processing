float sR, mR, hR;
float angSeg, angMinute, angHour;
float r, horas = 3;
ArrayList<Punto> pntsS = new ArrayList();
ArrayList<Punto> pntsM = new ArrayList();

void setup() {
  size(450, 450);
  r = min(width+(0.15*width), height+(0.15*height)) / 2;
  sR = r * 0.72;
  mR = r * 0.6;
  hR = r * 0.5;
}

void draw() {
  background(0);
  int h = height;
  int w = width;
  int hr = hour();
  int mn = minute();
  int sc = second();
  int grosor = 12;
  
  angSeg = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  angMinute = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  angHour = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  fill(255);
  noStroke();
  textSize(r*0.05);
  text(hr + ":" + mn + ":" + sc, 0, r*0.05);
  
  strokeWeight(grosor-10);
  stroke(255, 0, 0);
  line(w/2, h/2, (w/2 + cos(angSeg) * (sR-(r*0.15))), (h/2 + sin(angSeg) * (sR-(r*0.15))));
  
  if(sc==0)
  {
    fill(0, 0, 0);
    strokeWeight(r/50);
    pntsS = new ArrayList();
    beginShape(POINTS);
    for(int i = 0; i < pntsS.size(); ++i)
    {
      vertex(pntsS.get(i).getX(), pntsS.get(i).getY());
    }
    endShape();
  }
  else
  {
    fill(0, 0, 255);
    strokeWeight(r/50);
    Punto p = new Punto(w/2 + cos(angSeg) * (sR-(r*0.15)), h/2 + sin(angSeg) * (sR-(r*0.15)));
    pntsS.add(p);
    beginShape(POINTS);
    for(int i = 0; i < pntsS.size(); ++i)
    {
      vertex(pntsS.get(i).getX(), pntsS.get(i).getY());
    }
    endShape();
  }
  
  strokeWeight(grosor-5);
  stroke(0, 128, 255);
  line(w/2, h/2, (w/2 + cos(angMinute) * (mR-(r*0.15))), (h/2 + sin(angMinute) * (mR-(r*0.15))));
 
  strokeWeight(grosor);
  stroke(255, 255, 255);
  line(w/2, h/2, (w/2 + cos(angHour) * (hR-(r*0.25))), (h/2 + sin(angHour) * (hR - (r*0.25))));

  fill(127,255,0);
  stroke(127,255,0);
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = w/2 + cos(angle) * sR;
    float y = h/2 + sin(angle) * sR;
    if(a%15==0)
    {
      String horasText = Float.toString(horas);
      horasText = horasText.replaceFirst("\\.([0-9])+", "");
      text(horasText, x, y);
      if(horas == 12)
      {
        horas = 1;
      }
      else
      {
        ++horas;
      }
    }
    else
    {
       vertex(x, y);
    }
  }
  endShape();
}

class Punto
{
  private float x, y;
  
  public Punto(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
 public float getX()
 {
   return x;
 }
 
 public float getY()
 {
   return y;
 }
}
