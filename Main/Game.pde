class Game {
  int score, highScore;
  button newGameButton;
  Board board;
  boolean active = false;
  void show() {
    active = true;
    background(250, 248, 239);
    fill(255, 255, 255);
    newGameButton = new button(width*3/10, 50, width/5, 50, "Nyt spil");
    rect(width*5/10+30, 50, width/10, 50);
    rect(width*6/10+40, 50, width/10, 50);
    textSize(24);
    newGameButton.show();
    textAlign(CENTER, CENTER);
    fill(0, 0, 0);
    text("Score: " + str(score), width*11/20+30, 75);
    text("Bedste score: " + str(highScore), width*13/20+40, 75);
    //Board innit
    board = new Board();
    fill(187, 173, 160);
    rect(width*5/20, width/10-75, width*5/10, width*5/10, 15);
    board.addRandTile();
    board.updateBoard();
  }
  void update() {
    if(newGameButton.checkInput() && active) {
      board.resetBoard();
    }
  }

}
