
class Ship {
  // GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  int speed = 8;
  float sizeX=70;
  float sizeY=10;




  //CONSTRUCTOR
  Ship(float _x, float _y) {
    x = _x;
    y = _y;
  }


  //FUNCTIONS 
  void move(int _key, int _keyCode) {
    if (_key=='a' || _keyCode==LEFT) {
      x=x-speed;
      if (x<0){
        x=0;
      }
    } else if (_key=='d' || _keyCode==RIGHT) {
      x=x+speed;
      if (x>width-sizeX){
        x=width-sizeX;
      }
    }
  }

  void display() {
    fill(255);
    rect(x, y, sizeX, sizeY,4);
  }
}
