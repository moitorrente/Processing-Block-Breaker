 //<>//
int countDestroyed=0;
int rows=10, columns=17;
int menuPoint=0;
int exitPoint=0;
Ship myShip;
Ball myBall;
Start_screen myStartScreen;
Pause_screen myPauseScreen;
Options_screen myOptionsScreen;
Block [] [] blockCollection = new Block [columns][rows];
PFont fontInfor, fontPause;
int lifes, initialLifes;
boolean run = false, contGame=false;
boolean exit=false, newgame=false, options=false;
boolean startScreen = true, gameScreen = false, waitingScreen = false, pauseScreen = false, exitScreen = false, optionsScreen=true;
boolean ContinueGame=false, gameOver = false, gameWin = false;
boolean optionsSelected=false;
int totalBlocks=0;
int height=1000;
int width=1224;
float startBallx=width/2;
float startBally=height/2;
String lifesString="♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥";
String winMessage="YOU WON!!!", loseMessage="GAME OVER", displayMessage;
int ballColour=255;

void setup() {
  size (width, height);
  noStroke();
  smooth();
  rows=1;
  columns=1;
  displayMessage="";
  countDestroyed=0;
  run=false;
  initialLifes = lifes = 1;
  totalBlocks=columns*rows;
  myShip = new Ship(width/2, 7*height/8);
  myBall = new Ball(startBallx, startBally, ballColour);
  myStartScreen = new Start_screen();
  myPauseScreen = new Pause_screen();
  myOptionsScreen = new Options_screen();
  fontInfor = createFont("Arial", 20, true);
  fontPause = createFont("Arial", 200, true);
  for (int numY = 0; numY < rows; numY++) {
    for (int numX = 0; numX < columns; numX++) {
      blockCollection[numX][numY]= new Block(numX, numY);
    }
  }
}

void draw() {
  background(#9D9797);  
  if (startScreen) {
    myStartScreen.display(contGame);
    myStartScreen.menu(menuPoint);
  } else if (optionsScreen) {
    myOptionsScreen.display();
  } else if (waitingScreen||gameScreen) {
    displayInformation();
    myShip.display();                                                   
    myBall.display();
    myBall.compare();
    if (run) {                                                          
      myBall.run();
    }

    if (lifes==0) {
      gameOver=true;
      gameFinal();
    } else if (countDestroyed==totalBlocks) {
      gameWin=true;
      gameFinal();
    }

    if (keyPressed) {                                                   
      if (key=='a' || key=='d' || keyCode==RIGHT || keyCode==LEFT) {
        myShip.move(key, keyCode);
      }
    }
    for (int numY = 0; numY <  rows; numY++) {
      for (int numX=0; numX <  columns; numX++) {
        blockCollection[numX][numY].run(numX, numY);
      }
    }
  }
}

void keyPressed() {
  if (key == ENTER && startScreen) {
    if (newgame) {
      run = false;
      startScreen = false;
      waitingScreen = true;
      optionsScreen= false;
      contGame=false;
      setup();
    } else if (ContinueGame) {
      run = false;
      contGame = false;
      gameScreen = false;
      startScreen = false;
      waitingScreen = true;
      optionsScreen= false;
      contGame=false;
    } else if (options) {
      run = false;
      gameScreen = false;
      startScreen = false;
      waitingScreen = false;
      optionsScreen = true;
    } else if (exit) {
      exit();
    }
  }

  if (key==' ') {
    if (waitingScreen||gameScreen) {
      run=true;
      waitingScreen = false;
      gameScreen = true;
    }
    if (gameOver) {
      gameOver = false;
      setup();
      loop();
    } 
    if (gameWin) {
      gameWin = false;
      setup();
      loop();
    }
  }


  if (exitScreen) {
    if (key == 'y') {
      startScreen = true;
      gameScreen = false;
      contGame = true;
      loop();
    } else if (key == 'n') {
      exitScreen = false;
      gameScreen = true;
      loop();
    }
  }
  
  if(optionsScreen){
    if(key == 'e'){
      optionsScreen = false;
      startScreen = true;
    }
  }

  if (gameScreen) {
    if (key == 'e' && looping) {
      noLoop();
      exitScreen=true;
      myPauseScreen.displayExit();
    } else if (key == 'p') {
      if (looping)
      {
        noLoop();
        pauseScreen = true;
        myPauseScreen.displayPause();
      } else if (pauseScreen) {   
        pauseScreen = false;
        loop();
      }
    }
  }
}

void keyReleased() {
  if (startScreen) {
    if (key == 'w'|| keyCode ==UP) {
      menuPoint--;
      if (menuPoint<0) menuPoint=0;
    } else if (key == 's' || keyCode==DOWN) {
      menuPoint++;
      if (menuPoint>2 && !contGame) { 
        menuPoint=2;
      } else if (menuPoint>3 && contGame) {
        menuPoint=3;
      }
    }
  }
}


void displayInformation() {
  textFont(fontInfor, 20);                                           
  fill(255);
  if (waitingScreen) {
    textAlign(CENTER, CENTER);
    if (newgame) {
      text("Press space to start", width/2, height/2-50);
    } else if (ContinueGame) {
      text("Press space to continue", width/2, height/2-50);
    }
  }
  textAlign(LEFT);
  text("Pulsa la tecla e para salir del juego", width*0.7, height*0.93);
  text("Pulsa la tecla p para pausar/continuar", width*0.7, height*0.96);
  textAlign(LEFT);
  text("Destruidos: "+countDestroyed+"/"+totalBlocks, width*0.01, height*0.96);
  textSize(30);
  fill(0);
  text(lifesString.substring(0, initialLifes*2), width*0.01, height*0.93);
  fill(255, 0, 0);
  text(lifesString.substring(0, lifes*2), width*0.01, height*0.93);
}

void gameFinal() {
  fill(255);
  textAlign(CENTER, CENTER);
  if (gameOver) {
    displayMessage=loseMessage;
  } else if (gameWin) {
    displayMessage=winMessage;
  }
  text(displayMessage, width/2, height/2);
  text("Press space to restart", width/2, height*0.6);
  noLoop();
}
