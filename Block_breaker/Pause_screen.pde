class Pause_screen {
  PFont fontPause, fontExit, fontMessage;
  String gamePaused = "GAME PAUSED", gameExit = "Are you sure you\n want to exit?";
  String message = "Press Y (Yes) or N (No)";
  float leftSelX, leftSelY, rightSelX, rightSelY;
  float selWidth, selSize = 30;


  Pause_screen() {
    fontPause = createFont("Arial", 100, true);
    fontExit  = createFont("Arial", 100, true);
    fontMessage = createFont("Arial", 100, true);
  }



  void displayPause() {
    textFont(fontPause, 100);                                           
    fill(255);
    textAlign(CENTER, CENTER);
    text(gamePaused, width/2, height/2);
  }

  void displayExit() {
    textFont(fontExit, 70);                                           
    fill(255);
    textAlign(CENTER, CENTER);
    text(gameExit, width/2, height*0.4);
    textAlign(CENTER,CENTER);
    textFont(fontMessage, 50);
    text(message, width/2, height*0.6);
  }
}
