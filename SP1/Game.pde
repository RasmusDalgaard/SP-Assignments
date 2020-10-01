class Game { //<>//

  int w;                    //Width
  int h;                    //Height
  int numOfEnemies;         //Number of enemies
  int numOfFoods;           //Number of foods
  int player1Life;          //Player1 HP
  int player2Life;          //Player2 HP
  int maxPlayerLife = 100;  //Maximum player HP
  int [][] board;           //The board
  Keys keys;                //Keys to control the movement
  Dot player1;              //The first user-controlled player
  Dot player2;              //The second user-controlled player
  Dot[] enemies;            //An array of enemies
  Dot[] food;               //An array of food

  //Konstruktør
  Game (int w, int h, int numOfEnemies, int numOfFoods) {
    this.w = w;
    this.h = h;
    this.numOfEnemies = numOfEnemies;
    this.numOfFoods = numOfFoods;

    player1Life = 100;
    player2Life = 100;
    board = new int[w][h];
    keys = new Keys();
    player1 = new Dot(0, 1, w-1, h-1);
    player2 = new Dot(0, 1, w-1, h-1);

    enemies = new Dot[numOfEnemies];
    for (int i = 0; i < numOfEnemies; i++) {
      enemies[i] = new Dot(w-1, h-1, w-1, h-1);
    }

    food = new Dot[numOfFoods];
    for (int i = 0; i < numOfFoods; i++) {
      food[i] = new Dot((int)random(w-1), (int)random(h-1), w-1, h-1);
    }
  }
  //Metoder  
  void update() {
    updatePlayers();
    updateFood();
    updateEnemies();
    checkForCollisions();
    clearBoard();
    populateBoard();
  }
  
  void updatePlayers() {
    //Update player1
    if (keys.wDown) {
      player1.moveUp();
    }
    if (keys.aDown) {
      player1.moveLeft();
    }
    if (keys.sDown) {
      player1.moveDown();
    }
    if (keys.dDown) {
      player1.moveRight();
    }
    
    //Update player2
    if (keys.topArrowDown) {
      player2.moveUp();
    }
    if (keys.leftArrowDown) {
      player2.moveLeft();
    }
    if (keys.bottomArrowDown) {
      player2.moveDown();
    }
    if (keys.rightArrowDown) {
      player2.moveRight();
    }
  }

  void updateEnemies() {
    //Looper igennem alle enemy i arrayet, da det skal gælde for dem alle
    for (int i = 0; i < enemies.length; i++) {
      //Nogle gange skal en enemy følge efter en player
      //Andre gange skal den bare move random

      if (i >= 0) {
        //Afstanden mellem player1 og enemy på x-aksen
        int dX1 = player1.getX() - enemies[i].getX();
        //Afstanden mellem player1 og enemy på y-aksen
        int dY1 = player1.getY() - enemies[i].getY();



        //Hvis player1 er til højre for enemy - enemy move right
        if (dX1 > 0) {
          enemies[i].moveRight();
          //Hvis player1 er til venstre for enemy - enemy move left
        } else if (dX1 < 0) {
          enemies[i].moveLeft();
          //Hvis player1 er under enemy - enemy move down
        } else if (dY1 > 0) {
          enemies[i].moveDown();
          //Hvis player1 er over enemy - enemy move up
        } else if (dY1 < 0) {
          enemies[i].moveUp();
        }

        //Afstanden mellem player2 og enemy på x-aksen
        int dX2 = player2.getX() - enemies[i].getX();
        //Afstanden mellem player2 og enemy på y-aksen
        int dY2 = player2.getY() - enemies[i].getY();

        //Hvis player2 er til højre for enemy - enemy move right
        if (dX2 > 0) {
          enemies[i].moveRight();
          //Hvis player2 er til venstre for enemy - enemy move left
        } else if (dX2 < 0) {
          enemies[i].moveLeft();
          //Hvis player2 er under enemy - enemy move down
        } else if (dY2 > 0) {
          enemies[i].moveDown();
          //Hvis player2 er over enemy - enemy move up
        } else if (dY2 < 0) {
          enemies[i].moveUp();
        }
      }
      //Random movement 
      int randNum = (int)random(4);
      if (randNum == 0) {
        enemies[i].moveLeft();
      }
      if (randNum == 1) {
        enemies[i].moveRight();
      }
      if (randNum == 2) {
        enemies[i].moveDown();
      }
      if (randNum == 3) {
        enemies[i].moveUp();
      }
    }
  }

  void updateFood() {
    //Looper igennem alle food i arrayet, da det skal gælde for dem alle
    for (int i = 0; i < food.length; i++) {
      //food skal løbe væk fra en player

      if (i >= 0) {
        //Afstanden mellem player1 og food på x-aksen
        int dX1 = player1.getX() - food[i].getX();
        //Afstanden mellem player1 og enemy på y-aksen
        int dY1 = player1.getY() - food[i].getY();

        //Hvis player1 er til højre for food - food move left
        if (dX1 > 0) {
          food[i].moveLeft();
          //Hvis player1 er til venstre for food - food move right
        } else if (dX1 < 0) {
          food[i].moveRight();
          //Hvis player1 er under food - food move up
        } else if (dY1 > 0) {
          food[i].moveUp();
          //Hvis player1 er over food - food move down
        } else if (dY1 < 0) {
          food[i].moveDown();
        }

        //Afstanden mellem player2 og food på x-aksen
        int dX2 = player2.getX() - food[i].getX();
        //Afstanden mellem player2 og enemy på y-aksen
        int dY2 = player2.getY() - food[i].getY();

        //Hvis player2 er til højre for food - food move left
        if (dX2 > 0) {
          food[i].moveLeft();
          //Hvis player2 er til venstre for food - food move right
        } else if (dX2 < 0) {
          food[i].moveRight();
          //Hvis player2 er under food - food move up
        } else if (dY2 > 0) {
          food[i].moveUp();
          //Hvis player2 er over food - food move down
        } else if (dY2 < 0) {
          food[i].moveDown();
        }
      }
      //Random movement 
      int randNum = (int)random(4);
      if (randNum == 0) {
        food[i].moveLeft();
      }
      if (randNum == 1) {
        food[i].moveRight();
      }
      if (randNum == 2) {
        food[i].moveDown();
      }
      if (randNum == 3) {
        food[i].moveUp();
      }
    }
  }


  void clearBoard() {
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        board[x][y] = 0;
      }
    }
  }

  void populateBoard() {
    //Inserts the player objects on the board
    board[player1.getX()][player1.getY()] = 1;
    board[player2.getX()][player2.getY()] = 2;
    //Inserts the enemies on the board
    for (int i = 0; i < enemies.length; i++) {
      board[enemies[i].getX()][enemies[i].getY()] = 3;
    }
    //Inserts the food on the board
    for (int i = 0; i < food.length; i++) {
      board[food[i].getX()][food[i].getY()] = 4;
    }
  }

  void checkForCollisions() {
    //Hvis der er en enemy i samme feldt som player er der kollision
    //Spørg hver fjende om de er samme sted som en player
    for (int i = 0; i < enemies.length; i++) {
      if (enemies[i].getX() == player1.getX() && enemies[i].getY() == player1.getY()) {
        //Player mister 1 playerLife
        player1Life--;
        //Player1 dør hvis playerLife rammer 0
        if (player1Life <= 0) {
          player1Life = 0;
        }
      }
      if (enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY()) {
        //Player mister 1 playerLife
        player2Life--;
        //Player2 dør hvis playerLife rammer 0
        if (player2Life <= 0) {
          player2Life = 0;
        }
      }
    }
    //Hvis der er en food i samme feldt som en player er der kollision
    //Spørg hver food om de er samme sted som en player
    for (int i = 0; i < food.length; i++) {
      if (food[i].getX() == player1.getX() && food[i].getY() == player1.getY()) {
        //Player1 får 1 playerLife mere
        player1Life++;
        //Den food der havde kollision med player1 bliver erstattet med en ny food et random sted
        food[i] = new Dot((int)random(w-1), (int)random(h-1), w-1, h-1);
        //PlayerLife kan ikke overstige maxPlayerLife
        if (player1Life >= maxPlayerLife) {
          player1Life = maxPlayerLife;
        }
      }
      if (food[i].getX() == player2.getX() && food[i].getY() == player2.getY()) {
        //Player2 får 1 playerLife mere
        player2Life++;
        //Den food der havde kollision med player2 forsvinder og der bliver indsat en ny food et random sted
        food[i] = new Dot((int)random(w-1), (int)random(h-1), w-1, h-1);
        //PlayerLife kan ikke overstige maxPlayerLife
        if (player2Life >= maxPlayerLife) {
          player2Life = maxPlayerLife;
        }
      }
    }
  }
  
  void onKeyPressed(char k) {
    keys.onKeyPressed(k);
  }
  
  void onKeyReleased(char k) {
    keys.onKeyReleased(k);
  }

  int getWidth() {
    return w;
  }

  int getHeight() {
    return h;
  }

  int getPlayer1Life() {
    return player1Life;
  }

  int getPlayer2Life() {
    return player2Life;
  }

  int[][] getBoard() {
    return board;
  }
}
