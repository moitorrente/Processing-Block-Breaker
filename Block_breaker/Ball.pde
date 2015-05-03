
class Ball {
  float size=10;
  float x = 0;
  float y = 0;
  float speedX = 5;
  float speedY = 5;
  int colour=255;
  float mx[] = new float[15];
  float my[] = new float[15];

  //CONSTRUCTOR
  Ball(float _x, float _y, int _colour) {
    x = _x;
    y = _y;
    colour = _colour;
  }

  //FUNCTIONS 
  void run() {
    move();
    bounce();
  }

  void compare() {
    if (y>(7*height/8+size+myShip.sizeY)) {
      lifes-=1;
      position((myShip.x+myShip.x+myShip.sizeX)/2, myShip.y-size/2);
      run=false;
    }
    if (y==myShip.y-size/2 && !run) {
      position((myShip.x+myShip.x+myShip.sizeX)/2, myShip.y-size/2);
    }
  }

  void position(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void bounce() {
    if (x>width || x<1) {
      speedX=-speedX;
      bounceFile.play();
    } else if (y>height || y<1) {
      speedY=-speedY;
      bounceFile.play();
    }
    if (y>myShip.y-size/2 && x>(myShip.x) && x<(myShip.x+myShip.sizeX)) {
      speedY=-speedY;
      bounceFile.play();
    }
  }

  void move() {
    x+=speedX;
    y+=speedY;
  }

  void display() {
    for (int i=1; i<mx.length; i++) {
      mx[i-1] = mx[i];
      my[i-1] = my[i];
    }
    
    mx[mx.length-1] = x;
    my[my.length-1] = y;
    
    ellipse(x,y,size,size);
    for (int i=0; i< mx.length; i++) {
      noStroke();
      fill(colour,100);
      ellipse(mx[i], my[i], i, i);
    }
  }
}
