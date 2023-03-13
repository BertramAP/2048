class button { 
  int x, y, w, h;
  String text;
  button(int x, int y, int w, int h, String text) {
  this.x = x;
  this.y = y;
  this.w = w;
  this.h = h;
  this.text = text;
  }
  void show() {
    fill(66, 105, 245);
    rect(this.x, this.y, this.w, this.h);
    fill(0, 0, 0)
    text(this.text, this.x+this.w/2, this.y+this.h/2);
    textAlign(CENTER, CENTER);
  }
  boolean checkInput() {
    if((this.x >= mouseX && mouseX <= this.x+this.w) && (this.y >= mouseY && mouseY <= this.y+this.h)) {
      return true;
    } else return false;
  }

}
