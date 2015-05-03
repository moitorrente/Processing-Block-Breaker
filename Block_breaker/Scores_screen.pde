class Scores_screen {
  PFont fontDetail, fontScores, fontTitle;
  String title = "High Scores Screen";
  Table table = loadTable("highscores.txt", "header,csv");
  int i=0;



  Scores_screen() {
    fontScores = createFont("Arial", 100, true);
    fontDetail = createFont("Arial", 100, true);
    fontTitle  = createFont("Arial", 100, true);
  }

  void display() {
    textFont(fontTitle, 100);                                           
    fill(255);
    textAlign(CENTER, CENTER);
    text(title, width/2, height*0.1);
    displaydetail();
    displayScores();

  }

  void displayScores() {
    for (TableRow row : table.rows ()) {
      int rank = row.getInt("rank");
      String name  = row.getString("name");
      String score = row.getString("score");
      String date  = row.getString("date"); 
      textAlign(LEFT, CENTER);
      textFont(fontScores, 30);
      text(rank+".",width*0.20,height*(0.2+0.07*rank));
      text(name,width*0.35,height*(0.2+0.07*rank));
      text(date,width*0.75,height*(0.2+0.07*rank));
      textAlign(RIGHT, CENTER);
      text(score,width*0.65,height*(0.2+0.07*rank));      
    }
  }

  void displaydetail() {
    textAlign(CENTER, CENTER);
    textFont(fontDetail, 50);
    text("Rank",  width*0.20, height*0.2);
    text("Name",  width*0.40, height*0.2);
    text("Score", width*0.60, height*0.2);
    text("Date",  width*0.80, height*0.2);
  } 
}
