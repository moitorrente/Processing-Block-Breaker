class Block { 
  float x = 0;
  float y = 0;
  boolean keep=true;
  float longY=30, longX=70;
  float sY, sX;
  //float BlockColor;

  // float BlockColor1 = random(255);
  // float BlockColor2 = random(255);
  // float BlockColor3 = random(255);
  Block(float _x, float _y) {
    x = _x*72;
    y = _y*32;
  }


  void run(int eX, int eY) {
    destroy(eX, eY);
    display();
  }

  void destroy(int column, int row) {
    if (keep) {
      sX = column*72;
      sY = row*32;
      if (myBall.y+myBall.size/2>sY && myBall.y-myBall.size/2<(sY+longY) && myBall.x+myBall.size/2>sX && myBall.x-myBall.size/2<(sX+longX)) {
        if (myBall.speedY<0 && (myBall.y-myBall.size/2+1==sY+longY)||(myBall.y-myBall.size/2+2==sY+longY)||(myBall.y-myBall.size/2+3==sY+longY)||(myBall.y-myBall.size/2+4==sY+longY)) {
          myBall.speedY=-myBall.speedY;
        }
        if (myBall.speedY>0 && (myBall.y+1==sY)||(myBall.y+2==sY)||(myBall.y+3==sY)||(myBall.y+4==sY)) {
          myBall.speedY=-myBall.speedY;
        }
        if (myBall.speedX>0 && (myBall.x+1==sX)||(myBall.x+2==sX)||(myBall.x+3==sX)||(myBall.x+4==sX)) {
          myBall.speedX=-myBall.speedX;
        } 
        if (myBall.speedX<0 && (myBall.x-myBall.size/2+1==sX+longX)||(myBall.x-myBall.size/2+2==sX+longX)||(myBall.x-myBall.size/2+3==sX+longX)||(myBall.x-myBall.size/2+4==sX+longX)) {
          myBall.speedX=-myBall.speedX;
        } 
        keep=false;
        countDestroyed++;
        println("-------------------Destruccion de bloque: "+countDestroyed+" -------------------");
        println("    Bloque en posicion row: "+row+"   column: "+column);
        println("    Ball:                x: "+ myBall.x+"  y: "+myBall.y) ;
        println("    Block: izquierdaX: "+ sX+" derechaX: "+(sX+longX)+" sY: "+sY+"\n");
        x =-50;
        y =-50;
      }
    }
  }


  void display() {
    fill(0);
    rect(x, y, longX, longY, 5);
  }
}
