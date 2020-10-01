class Dot {
  //Egenskaber
  int xPos, yPos;
  int xMax, yMax;

  //Konstruktør
  Dot(int xPos, int yPos, int xMax, int yMax) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.xMax = xMax;
    this.yMax = yMax;
  }
  //Metoder

  void moveUp() {
    yPos--;
    if (yPos <= 0) {
      yPos = 0;
    }
  }

  void moveDown() {
    yPos++;
    if (yPos >= yMax) {
      yPos = yMax;
    }
  }

  void moveLeft() {
    xPos--;
    if (xPos <= 0) {
      xPos = 0;
    }
  }

  void moveRight() {
    xPos++;
    if (xPos >= xMax) {
      xPos = xMax;
    }
  }
  int getX() {
    return xPos;
  }

  int getY() {
    return yPos;
  }
}
