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
    rect(width/3, height/10, width/3, height*8/10, 15);
    //Omkring hvordan spillet spilles tekst boks
    //rect(width*6/10, height/10, width*3/10, height*8/10, 15);
    fill(0, 0, 0);
    textAlign(CENTER, CENTER);
    //Tekst til omkring spillet tekst boks
    textSize(48);
    text("Omkring 2048", width/2, height/10+70);
    textSize(22);
    text("2048 er et online- og mobilspil, der blev udgivet i marts 2014. \n Formålet med spillet er at bevæge brikkerne rundt på \n spillepladen, og dermed skabe tallet 2048, som spillets navn \nogså hentyder til. Spilleren kan bevæge brækkerne med piltasterne \npå deres tastetur. Hvis spilleren får en brik med værdien 2048, \nvinder de spillet. Hvis spilleren ikke kan bevæge nogle brikker, \nvil spillet fortælle spilleren de har tabt.", width/2, height/2);
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
