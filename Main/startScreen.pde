class StartScreen {
  String startText = "2048";
  Button button1 = new Button(width*1/3, height*2/5, width/3, 80, "Spil");
  Button button2 = new Button(width*1/3, height*3/5, width/3, 80, "Hvad er 2048?");
  boolean active = false;
  void show() {
    this.active = true;
    background(255, 255, 255);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0, 0, 0);
    text(startText, width/2, height*2/10);
    button1.show();
    button2.show();

  }
  void update() {

    if(button1.checkInput() && this.active) {
      this.active = false;
      game.show();
    } else if(button2.checkInput() && this.active) { 
      this.active = false;
      aboutScreen.show();
    }  
  }
}
