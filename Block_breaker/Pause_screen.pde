class Pause_screen {
  PFont fontPause, fontExit, fontMessage;
  String gamePaused = "GAME PAUSED", gameExit = "Are you sure you\n want to exit?";
  String message = "Press Y (Yes) or N (No)";
  String messageYes = "Yes";
  String messageNo = "No";
  float leftSelX, leftSelY, rightSelX, rightSelY;
  float selWidth, selSize = 30;
  int intBoxX, intBoxY, intBoxLongX, intBoxLongY;
  int extBoxX, extBoxY, extBoxLongX, extBoxLongY;
  int extBoxColor = #BEBEC4;
  int intBoxColor = #3C3D48;


  Pause_screen() {
    fontPause   = createFont("Arial", 100, true);
    fontExit    = createFont("Arial", 100, true);
    fontMessage = createFont("Arial", 100, true);
  }


  void displayPause() {
    boxMessage('P');
    textFont(fontPause, 100);                                           
    fill(255);
    textAlign(CENTER, CENTER);
    text(gamePaused, width/2, height/2);
  }

  void displayExit() {
    boxMessage('E');
    textFont(fontExit, 70);                                           
    fill(255);
    textAlign(CENTER, CENTER);
    text(gameExit, width/2, height*0.4);
    textAlign(CENTER, CENTER);
    textFont(fontMessage, 50);
    text(messageYes, width/2-150, height*0.6);
    text(messageNo, width/2+150, height*0.6);
  }

  void boxMessage(char _displayType) {
    fill(#0A0A0A, 100);
    rect(0, 0, width, height);
    switch(_displayType) {
    case 'P':
      extBoxX=420;
      extBoxY=120;
      break;

    case 'E':
      extBoxX = 420;
      extBoxY = 220;
      break;
    }

    extBoxLongX = 2*extBoxX;
    extBoxLongY = 2*extBoxY;
    intBoxX     = extBoxX-20;
    intBoxY     = extBoxY-20;
    intBoxLongX = extBoxLongX-40;
    intBoxLongY = extBoxLongY-40;

    fill(extBoxColor);
    rect(width/2-extBoxX, height/2-extBoxY, extBoxLongX, extBoxLongY, 10); 
    fill(intBoxColor);
    rect(width/2-intBoxX, height/2-intBoxY, intBoxLongX, intBoxLongY, 5);
  }
}
/*
fill(#BEBEC4);
 rect(width/2-420, height/2-120, 840, 240, 10);
 fill(#3C3D48);
 rect(width/2-400, height/2-100, 800, 200, 5);
 */
