class Start_screen {
  PFont fontTitle, fontNewGame, fontContinue, fontOptions, fontTip, fontName, fontExit;
  String Title = "Block Breaker", NewGame = "New game", Options = "Options";
  String Tip = "Press Enter to select an option ", Name = "Created by Moises Torrente using Processing", Exit= "Exit game";
  String Continue = "Continue game";
  float leftSelX, leftSelY, rightSelX, rightSelY;
  float selWidth, selSize = 30;
  float NewGameY, ContinueY, OptionsY, ExitY;


  Start_screen() {
    NewGameY  = 0.4;
    OptionsY  = 0.5;
    ExitY     = 0.6;
    ContinueY = 0.5;
    fontTitle    = createFont("Arial", 50, true);
    fontNewGame  = createFont("Arial", 30, true);
    fontContinue = createFont("Arial", 30, true);
    fontOptions  = createFont("Arial", 30, true);
    fontTip      = createFont("Arial", 30, true);
    fontName     = createFont("Arial", 30, true);
    fontExit     = createFont("Arial", 30, true);
  }

  void display(boolean contGame) {
    title();
    newGame();
    if (contGame) {
      OptionsY=0.6;
      ExitY=0.7;
      Continue();
    }
    options();
    tip();
    name();
    Exit();
  }



  void menu(int menuPoint) {
    println("Menu point: "+menuPoint);
    exit    = false;
    newgame = false;
    options = false;
    ContinueGame = false;
    if (menuPoint == 0) {
      selWidth = newGame();
      rightSelY = leftSelY = height*NewGameY - selSize/2;
      newgame = true;
    } else if (menuPoint == 1) {
      if (!contGame) {
        selWidth = options();
        rightSelY = leftSelY = height*OptionsY - selSize/2;
        options = true;
      } else if (contGame) {
        selWidth = Continue();
        rightSelY = leftSelY = height*ContinueY - selSize/2;
        ContinueGame = true;
      }
    } else if (menuPoint == 2) {
      if (!contGame) {
        selWidth = Exit();
        rightSelY = leftSelY = height*ExitY - selSize/2;
        exit = true;
      } else if (contGame) {
        selWidth = options();
        rightSelY = leftSelY = height*OptionsY - selSize/2;
        options = true;
      }
    } else if (menuPoint == 3) {
      selWidth = Exit();
      rightSelY = leftSelY = height*ExitY - selSize/2;
      exit = true;
    }



    leftSelX  = width/2 - selWidth/2 - selSize;
    rightSelX = width/2 + selWidth/2 + selSize;
    ellipse(leftSelX, rightSelY, selSize, selSize);
    ellipse(rightSelX, rightSelY, selSize, selSize);
  }


  void title() {
    textAlign(CENTER);
    textFont(fontTitle, 100);
    float TitleWidth = textWidth(Title);
    fill(255);
    text(Title, width/2, height*0.2);
    rect(width/2-TitleWidth/2, height*0.2+5, TitleWidth, 5);
  }

  float newGame() {
    textAlign(CENTER);
    textFont(fontNewGame, 50);
    fill(255);
    text(NewGame, width/2, height*NewGameY);
    float NewGameWidth = textWidth(NewGame);
    return NewGameWidth;
  }

  float Continue() {
    textAlign(CENTER);
    textFont(fontContinue, 50);
    fill(255);
    text(Continue, width/2, height*ContinueY);
    float ContinueWidth = textWidth(Continue);
    return ContinueWidth;
  }

  float options() {
    textAlign(CENTER);
    textFont(fontOptions, 50);
    fill(255);
    text(Options, width/2, height*OptionsY);
    float OptionsWidth = textWidth(Options);
    return OptionsWidth;
  }
  float Exit() {
    textAlign(CENTER);
    textFont(fontExit, 50);
    fill(255);
    text(Exit, width/2, height*ExitY);
    float ExitWidth = textWidth(Exit);
    return ExitWidth;
  }

  void tip() {
    textAlign(RIGHT);
    textFont(fontTip, 20);
    float TipWidth = textWidth(Tip);
    fill(255);
    text(Tip, width/2-TipWidth/2, height*0.95);
  }

  void name() {
    textAlign(LEFT);
    textFont(fontName, 20);
    float NameWidth = textWidth(Name);
    fill(255);
    text(Name, width/2+NameWidth/2, height*0.95);
  }
}
