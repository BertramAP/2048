startScreen startScreen;
Game game;
void setup() {
  fullScreen();
  startScreen = new startScreen();
  game = new Game();
  startScreen.show();
}
void mousePressed() {
  startScreen.update();
  game.update();
}
void draw() {

}
void keyPressed() {
  println("Key pressed");
  if(game.active && keyCode == UP) {
    if(game.board.moveTilesUP()) game.board.addRandTile();
    game.board.updateBoard();
    game.board.printBoard();
  }else if(game.active && keyCode == LEFT) {
    if(game.board.moveTilesLEFT()) game.board.addRandTile();
    game.board.updateBoard();
    game.board.printBoard();
  }else if(game.active && keyCode == RIGHT) {
    if(game.board.moveTilesRIGHT()) game.board.addRandTile();
    game.board.updateBoard();
    game.board.printBoard();
  }else if(game.active && keyCode == DOWN) {
    if(game.board.moveTilesDOWN()) game.board.addRandTile();
    game.board.updateBoard();
    game.board.printBoard();
  }
}
