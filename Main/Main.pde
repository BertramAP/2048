void setup() {
  fullScreen();
  startScreen startScreen = new startScreen();
  startScreen.show();
}
void mousePressed() {
  startScreen.update();
}
