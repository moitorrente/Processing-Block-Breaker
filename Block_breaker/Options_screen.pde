class Options_screen {
  PFont fontMessage;
  String displayMessage = "Options Screen";
  float leftSelX, leftSelY, rightSelX, rightSelY;
  float selWidth, selSize = 30;


  Options_screen() {
    fontMessage = createFont("Arial", 100, true);
  }



  void display() {
    textFont(fontMessage, 100);                                           
    fill(255);
    textAlign(CENTER, CENTER);
    text(displayMessage, width/2, height*0.1);
    textSize(30);
    text("Ball colour changed!", width/2, height*0.5);
    ballColour=myBall.colour=200;
    optionsSelected=true;
  }
}
