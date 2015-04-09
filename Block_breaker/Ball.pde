
class Ball {
  float size=10;// GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 2;
  float speedY = 8;
  int colour;
 // int colour=255;

  //CONSTRUCTOR
  Ball(float _x, float _y, int _colour) {
    x = _x;
    y = _y;
    colour = _colour;
  }

  //FUNCTIONS 
  void run() {
    // compare();
    // display();
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
    } else if (y>height || y<1) {
      speedY=-speedY;
    }
    if (y>myShip.y-size/2 && x>(myShip.x) && x<(myShip.x+myShip.sizeX)) {
      speedY=-speedY;
    }
  }

  void move() {
    x+=speedX;
    y+=speedY;
  }

  void display() {
    fill(colour);
    ellipse(x, y, size, size);
  }
}
