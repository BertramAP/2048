class Game {
  int score, highScore;
  button newGameButton;
  Board board;
  void show() {
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
    rect(width/5, height/5, width*3/5, height*3/5, 15);
    for(int row = 0; row < board.tileMap.length; row++) {
      for(int col = 0; col < board.tileMap[row].length; col++) {
        fill(board.tileMap[row][col].rgb);
        rect(width*(2+row*1.5)/10+10,height*(2+col*1.5)/10+10, width/7-10, height/7-10);
      }
    }
  }
}
