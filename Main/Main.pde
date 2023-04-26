StartScreen startScreen;
AboutScreen aboutScreen;
Game game;
void setup() {
  fullScreen();
  startScreen = new StartScreen();
  game = new Game();
  aboutScreen = new AboutScreen();
  startScreen.show();
}
void mousePressed() {
  startScreen.update();
  game.update();
  aboutScreen.update();
}
void draw() {
  //Denne funktion skal kaldes for at automatisk køre mousePressed og keyPressed hvert frame.
}

void keyPressed() {
  println("Key pressed");
  /*if(game.active) {
    Tile[][] tempMap = game.board.tileMap;
  }*/
  if(game.active && keyCode == UP) {
    if(game.board.moveTilesUP()) game.board.addRandTile();
    game.updateGame();
    //game.board.printBoard();
  }else if(game.active && keyCode == LEFT) {
    if(game.board.moveTilesLEFT()) game.board.addRandTile();
    game.updateGame();
    //game.board.printBoard();
  }else if(game.active && keyCode == RIGHT) {
    if(game.board.moveTilesRIGHT()) game.board.addRandTile();
    game.updateGame();
    //game.board.printBoard();
  }else if(game.active && keyCode == DOWN) {
    if(game.board.moveTilesDOWN()) game.board.addRandTile();
    game.updateGame();
    //game.board.printBoard();
  }
  if(game.active && game.checkLost()) {
    game.active = false;
    fill(250, 248, 239, 100);
    rect(width*5/20, width/10-75, width*5/10, width*5/10, 15);
    textAlign(CENTER, CENTER);
    fill(0, 0, 0);
    text("Du har desværre tabt.", width*10/20, width*7/20-75);
  } else if(game.active && game.checkWon()) {
    game.active = false;
    fill(250, 248, 239, 100);
    rect(width*5/20, width/10-75, width*5/10, width*5/10, 15);
    textAlign(CENTER, CENTER);
    fill(0, 0, 0);
    text("Tillykke, du har vundet.", width*10/20, width*7/20-75);
  }
}
