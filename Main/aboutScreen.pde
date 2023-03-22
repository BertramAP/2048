class AboutScreen {
  Button back;
  boolean active = false;
  void show() {
    background(255, 255, 255);
    this.active = true;
    back = new Button(0, 0, width/6, 70, "Tilbage");
    back.show();
    fill(#FAF8EF);
    //Omkring spillet tekst boks
    rect(width/10, height/10, width*3/10, height*8/10, 15);
    //Omkring hvordan spillet spilles tekst boks
    rect(width*6/10, height/10, width*3/10, height*8/10, 15);
    fill(0, 0, 0);
    textAlign(CENTER, CENTER);
    //Tekst til omkring spillet tekst boks
    textSize(48);
    text("Omkring 2048", width*5/20, height/10+20);
    textSize(22);
    text("2048 er et online- og mobilspil, der blev udgivet i marts 2014. \n Formålet med spillet er at bevæge brikkerne rundt på spillepladen, \nog dermed skabe tallet 2048, som spillets navn også hentyder til.", width*5/20, height/5+20);
    //Tekst til omkring hvordan spillet spilles tekst boks
    text("", width*15/20, height/10);
  }
  void update() {
    if(this.active && back.checkInput()) {
      this.active = false; 
      startScreen.show();
    }
  }
}
