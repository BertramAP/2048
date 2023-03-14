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
}
void draw() {

}
