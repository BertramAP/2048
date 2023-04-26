class Board {
  Tile[][] tileMap;
  int score = 0;
  Board() {
    this.tileMap = new Tile[][] {
      new Tile[] {new Tile(0), new Tile(0), new Tile(0), new Tile(0)},
      new Tile[] {new Tile(0), new Tile(0), new Tile(0), new Tile(0)},
      new Tile[] {new Tile(0), new Tile(0), new Tile(0), new Tile(0)},
      new Tile[] {new Tile(0), new Tile(0), new Tile(0), new Tile(0)},
    };
  }

  void updateBoard() {
    textAlign(CENTER, CENTER);
    textSize(32);
    for(int row = 0; row < this.tileMap.length; row++) {
      for(int col = 0; col < this.tileMap.length; col++) {
        this.tileMap[row][col].updateRGB();
        fill(this.tileMap[row][col].rgb);
        rect(width*(2.5+col)/9+10, width*(2+row)/9-250, width/9-10, width/9-10, 10);
        fill(0, 0, 0);
        text(str(tileMap[row][col].value), int(width*(2.5+col)/9+(width/9-10)/2), width*(2+row)/9-250+(width/9-10)/2);
      }
    }
  } /*
  void animateBoard(Tile[][] oldBoard, dir direction) {
    boolean notDone = true;
    while(notDone) {
      if(direction == dir.left) {
        int row = this.tileMap.length;
        int col = this.tileMap.length;
        fill(oldBoard[row][col].rgb);
        rect(width*(2.5+col)/9+10, width*(2+row)/9-250, width/9-10, width/9-10, 10);
        if((oldBoard[row][col].value != this.tileMap[row][col].value || this.tileMap[row][col].value == 0) && row != 0) {
          oldBoard[row-1][col].value = oldBoard[row][col].value;
          fill(oldBoard[row][col].rgb);
          rect(width*(2.5+col)/9+10, width*(2+row)/9-250, width/9-10, width/9-10, 10);
          oldBoard[row][col].value = 0;
        } else if (col != 0) {
          col--;
        } else notDone = false;
      } else if(direction == dir.right) {
        int row = 0;
        int col = 0;
        
      }
    }
  }*/
  void addRandTile() {
    int row = 0;
    int x = (int) random(16);
    int i = 0;
    Daniel: while(true) {  
      for(int col = 0; col < tileMap[row].length; col++) { 
        if(tileMap[row][col].value == 0 && i < x) {
          i++;
        } else if(tileMap[row][col].value == 0 && i == x) {
          int y = (int) random(1, 2.5);
          tileMap[row][col].value = (int) pow(2, y);
          //tileMap[row][col].updateRGB();
          break Daniel;
        } 
      }
      if(row == tileMap.length-1) row = 0;
      else row++;
   }
  }
  boolean moveTilesUP() {
    //bool der skal bestemme om der kan tilføjes en tile
    boolean changed = false;
    for(int col = 0; col < tileMap.length; col++) {
      //temp arrays
      ArrayList<Integer> temp1 = new ArrayList<Integer>();
      ArrayList<Integer> temp2 = new ArrayList<Integer>();
       
      //tilføjer alle tiles med en værdi som ikke er nul
      //til et array, fra top til bund
      for(int row = 0; row < this.tileMap.length; row++) {
        if(this.tileMap[row][col].value != 0) {
          temp1.add(this.tileMap[row][col].value);
        } //Hvis der 0, bliver der lavet en ændring
        if(row < 0 && this.tileMap[row][col].value != 0 && this.tileMap[row-1][col].value == 0) changed = true;
      }
      //Tjek om nogle tiles skal forenes
      for(int row = 0; row  < temp1.size(); row++) {
        //Hvis to tiles ved siden af hinanden i en lodret vinkel
        if(row < temp1.size()-1 && temp1.get(row).equals(temp1.get(row+1))) {
          //Tilføj et element, som summen af 2 tiles.
          temp2.add(temp1.get(row)*2);
          score = score + temp1.get(row)*2;
          row++;
          changed = true;
        } else {
          temp2.add(temp1.get(row));
        }
      }
      //tøm rækken
      for(int row = 0; row < this.tileMap.length; row++) {
        tileMap[row][col].value = 0;
      }
      int j = 0;
      for(int i = 0; i < temp2.size(); i++) {
        this.tileMap[j][col].value = temp2.get(i);
        j++;
      }
    }
    return changed;
  }
  boolean moveTilesLEFT() {
    //bool der skal bestemme om der kan tilføjes en tile
    boolean changed = false;
    for(int row = 0; row < tileMap.length; row++) {
      //temp arrays
      ArrayList<Integer> temp1 = new ArrayList<Integer>();
      ArrayList<Integer> temp2 = new ArrayList<Integer>();
       
      //tilføjer alle tiles med en værdi som ikke er nul
      //til et array, fra bund til top
      for(int col = 0; col < this.tileMap.length; col++) {
        if(this.tileMap[row][col].value != 0) {
          temp1.add(this.tileMap[row][col].value);
        } //Hvis der 0, bliver der lavet en ændring
        if(col < 0 && this.tileMap[row][col].value != 0 && this.tileMap[row][col-1].value == 0) changed = true;
      }
      //Tjek om nogle tiles skal forenes
      for(int col = 0; col  < temp1.size(); col++) {
        //Hvis to tiles ved siden af hinanden i en lodret vinkel
        if(col < temp1.size()-1 && temp1.get(col).equals(temp1.get(col+1))) {
          //Tilføj et element, som summen af 2 tiles.
          temp2.add(temp1.get(col)*2);
          score = score + temp1.get(col)*2;
          col++;
          changed = true;
        } else {
          temp2.add(temp1.get(col));
        }
      }
      //tøm rækken
      for(int col = 0; col < this.tileMap.length; col++) {
        tileMap[row][col].value = 0;
      }
      int j = 0;
      for(int i = 0; i < temp2.size(); i++) {
        this.tileMap[row][j].value = temp2.get(i);
        j++;
      }
    }
    return changed;
  }
  boolean moveTilesRIGHT() {
    //bool der skal bestemme om der kan tilføjes en tile
    boolean changed = false;
    for(int row = 0; row < tileMap.length; row++) {
      //temp arrays
      ArrayList<Integer> temp1 = new ArrayList<Integer>();
      ArrayList<Integer> temp2 = new ArrayList<Integer>();
       
      //tilføjer alle tiles med en værdi som ikke er nul
      //til et array, fra bund til top
      for(int col = this.tileMap.length-1; col >= 0; col--) {
        if(this.tileMap[row][col].value != 0) {
          temp1.add(this.tileMap[row][col].value);
        } //Hvis der 0, bliver der lavet en ændring
        if(col != this.tileMap.length-1 && (this.tileMap[row][col].value != 0 && this.tileMap[row][col+1].value == 0)) {
          changed = true;
          println("Col = " + col + " Row = " + row);
          println("1st is" + (col != this.tileMap.length-1));
          println("2st is" + (this.tileMap[row][col].value != 0));
          println("3st is" + (this.tileMap[row][col+1].value == 0));
      }
      }
      //Tjek om nogle tiles skal forenes
      for(int col = 0; col  < temp1.size(); col++) {
        //Hvis to tiles ved siden af hinanden i en lodret vinkel
        if(col < temp1.size()-1 && temp1.get(col).equals(temp1.get(col+1))) {
          //Tilføj et element, som summen af 2 tiles.
          temp2.add(temp1.get(col)*2);
          score = score + temp1.get(col)*2;
          col++;
          println("Changed in adding");
          changed = true;
        } else {
          temp2.add(temp1.get(col));
        }
      }
      //tøm rækken
      for(int col = 0; col < this.tileMap.length; col++) {
        this.tileMap[row][col].value = 0;
      }
      int j = this.tileMap.length-1;
      for(int i = 0; i < temp2.size(); i++) {
        this.tileMap[row][j].value = temp2.get(i);
        j--;
      }
    }
    return changed;
  }
  boolean moveTilesDOWN() {
    //bool der skal bestemme om der kan tilføjes en tile
    boolean changed = false;
    for(int col = 0; col < tileMap.length; col++) {
      //temp arrays
      ArrayList<Integer> temp1 = new ArrayList<Integer>();
      ArrayList<Integer> temp2 = new ArrayList<Integer>();
       
      //tilføjer alle tiles med en værdi som ikke er nul
      //til et array, fra bund til top
      for(int row = tileMap.length-1; row >= 0; row--) {
        if(this.tileMap[row][col].value != 0) {
          temp1.add(this.tileMap[row][col].value);
        }  //Hvis der 0, bliver der lavet en ændring
        if(row < tileMap.length-1 && this.tileMap[row][col].value != 0 && this.tileMap[row+1][col].value == 0) changed = true;
      }
      //Tjek om nogle tiles skal forenes
      for(int row = 0; row  < temp1.size(); row++) {
        //Hvis to tiles ved siden af hinanden i en lodret vinkel
        if(row < temp1.size()-1 && temp1.get(row).equals(temp1.get(row+1))) {
          //Tilføj et element, som summen af 2 tiles
          temp2.add(temp1.get(row)*2);
          score = score + temp1.get(row)*2;
          row++;
          changed = true;
        } else {
          temp2.add(temp1.get(row));
        }
      }
      //tøm rækken
      for(int row = 0; row < this.tileMap.length; row++) {
        tileMap[row][col].value = 0;
      }
      int j = this.tileMap.length-1;
      for(int i = 0; i < temp2.size(); i++) {
        this.tileMap[j][col].value = temp2.get(i);
        j--;
      }
    }
    return changed;
  }
  void printBoard() {
    for(int row = 0; row < this.tileMap.length; row++) {
      for(int col = 0; col < this.tileMap.length; col++) {
        print(this.tileMap[row][col].value + ", ");
      }
      println();
    }
    println();
  }
  void resetBoard() {
    for(int row = 0; row < this.tileMap.length; row++) {
      for(int col = 0; col < this.tileMap[row].length; col++) {
        this.tileMap[row][col].value = 0;
      }
    }
    this.score = 0;
    this.addRandTile();
    this.updateBoard();
  }
}
