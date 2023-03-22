class Game {
  int score, highScore;
  Button newGameButton;
  Button back;
  Board board;
  boolean buttonActive = false;
  boolean active = false;
  void show() {
    //Ny baggrund
    background(250, 248, 239);
    //Board innit
    board = new Board();
    fill(187, 173, 160);
    rect(width*5/20, width/10-75, width*5/10, width*5/10, 15);
    board.addRandTile();
    board.updateBoard();
    //Sætter skærmen til at være aktiv, samt genstart knappen
    this.active = true;
    this.buttonActive = true;
    fill(255, 255, 255);
    //Knapper
    newGameButton = new Button(width*3/10, 50, width/5, 50, "Nyt spil");
    back = new Button(0, 0, width/6, 70, "Tilbage");
    newGameButton.show();
    back.show();
    //Score boxes
    updateScore();
  }
  void update() {
    if(this.buttonActive && newGameButton.checkInput()) {
      board.resetBoard();
      show();
    } else if(this.buttonActive && back.checkInput()) {
      this.active = false; 
      this.buttonActive = false;
      startScreen.show();
    }
  }
  boolean checkLost() {
    boolean lost = true;
    Loop: for(int row = 0; row < this.board.tileMap.length; row++) {
      for(int col = 0; col < this.board.tileMap[row].length; col++) {
        if(((row < this.board.tileMap.length-1) && (this.board.tileMap[row][col].value == this.board.tileMap[row+1][col].value)) || (this.board.tileMap[row][col].value == 0)) {
          lost = false;
          break Loop;
        } else if((col < this.board.tileMap[row].length-1 && this.board.tileMap[row][col].value == this.board.tileMap[row][col+1].value) || (this.board.tileMap[row][col].value == 0)){
          lost = false;
          break Loop;
        }
      }
    }
    return lost;
  }
  boolean checkWon() {
    for(int row = 0; row < this.board.tileMap.length; row++) {
      for(int col = 0; col < this.board.tileMap[row].length; col++) {
        if(this.board.tileMap[row][col].value == 2048) return true;
      }
    }
    return false;
  }
  void updateScore() {
    fill(255, 255, 255);
    rect(width*5/10+30, 50, width/10, 50);
    rect(width*6/10+40, 50, width/10, 50);
    this.score = board.score;
    if(this.score > this.highScore) this.highScore = this.score;

    textSize(24);
    textAlign(CENTER, CENTER);
    fill(0, 0, 0);
    text("Score: " + str(score), width*11/20+30, 75);
    text("Bedste score: " + str(highScore), width*13/20+40, 75);
  }
  void updateGame() {
    board.updateBoard();
    updateScore();
  }  
}
