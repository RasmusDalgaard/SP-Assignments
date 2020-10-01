class Keys {
  //Egenskaber
  boolean wDown = false;
  boolean aDown = false;
  boolean sDown = false;
  boolean dDown = false;

  boolean topArrowDown = false;
  boolean leftArrowDown = false;
  boolean bottomArrowDown = false;
  boolean rightArrowDown = false;

  //Konstruktør
  public Keys() {
  }

  //Metoder
  void onKeyPressed(char k) {
    if (k == 'w' || k == 'W') {
      wDown = true;
    }
    if (k == 'a' || k == 'A') {
      aDown = true;
    }
    if (k == 's' || k == 'S') {
      sDown = true;
    }
    if (k == 'd' || k == 'D') {
      dDown = true;
    }

    if (key == CODED) {
      if (keyCode == UP) {
        topArrowDown = true;
      }
      if (keyCode == LEFT) {
        leftArrowDown = true;
      }
      if (keyCode == DOWN) {
        bottomArrowDown = true;
      }
      if (keyCode == RIGHT) {
        rightArrowDown = true;
      }
    }
  }

  void onKeyReleased(char k) {
    if (k == 'w' || k == 'W') {
      wDown = false;
    }
    if (k == 'a' || k == 'A') {
      aDown = false;
    }
    if (k == 's' || k == 'S') {
      sDown = false;
    }
    if (k == 'd' || k == 'D') {
      dDown = false;
    }

    if (key == CODED) {
      if (keyCode == UP) {
        topArrowDown = false;
      }
      if (keyCode == LEFT) {
        leftArrowDown = false;
      }
      if (keyCode == DOWN) {
        bottomArrowDown = false;
      }
      if (keyCode == RIGHT) {
        rightArrowDown = false;
      }
    }
  }
}
