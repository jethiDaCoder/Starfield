class Particle{
  double myX, myY, myAngle, mySpeed;
  int myColor, sizeX, sizeY, constantX, constantY;
  
  Particle(){
    myX = 300;
    myY = 300;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myAngle = (double)(Math.random()*2*PI);
    mySpeed = (double)(Math.random()*11);
  }  
  
  void move(){
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
  
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}

class OddballParticle extends Particle{
  OddballParticle(){
    myX = 300;
    myY = 300;
    myColor = color(255, 255, 255);
    sizeX = 600;
    sizeY = 600;
    constantX = 20;
    constantY = 20;
  }
  
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, sizeX, sizeY);
    sizeX -= constantY;
    sizeY -= constantX;
    if (sizeX <= -700){
      constantY = -constantY;
      constantX = -constantX;
    }
    if (sizeX >= 700){
      constantY = -constantY;
      constantX = -constantX;
    }
  }
  
  void move(){
    
  }
}

Particle [] bob = new Particle[800];

void setup(){
size(600, 600);
background(0);
for (int i = 0; i < 1; i++)
  bob[i] = new OddballParticle();
for (int i = 1; i < bob.length; i++){
  bob[i] = new Particle();
  }
}

void draw(){
  background(0);
  for (int i = 0; i < bob.length; i++){
    bob[i].move();
    bob[i].show();
  }
}
