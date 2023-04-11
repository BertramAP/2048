class Tile {
  int value;
  color[] colors = new color[] {#EEE4DA, #EEE1C9, #F3B27A, #F69664, #F77C5F, #F75F3B, #EDD073, #EDCC62, #EDC950, #EDC53F, #EEC22D};
  color rgb = color(205, 193, 180); //256
  Tile(int value) {
    this.value = value;
  }
  void updateRGB() {
    if(value != 0) {
      this.rgb = colors[log2(this.value)-1];
      //this.rgb = color(255, 0, 0);
    } else this.rgb = color(#CDC1B4);
  }
  int log2(int n) {
    return (int) (log(n)/log(2));
  }
}
