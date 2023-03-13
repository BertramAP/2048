class startScreen {
  String startText = "2048";
  button button1 = new button(width*1/3, height*2/5, width/3, 80, "Spil");
  button button2 = new button(width*1/3, height*3/5, width/3, 80, "Hvad er 2048?");
  boolean active = true;
  void show() {
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0, 0, 0)
    text(startText, width/2, height*2/10);
    button1.show();
    button2.show();

  }
  void update() {
    if(button1.checkInput() && active) {
      active = false;
    } else if(button2.checkInput() && active) { 
      active = false;
      background();
    }  
  }
}
