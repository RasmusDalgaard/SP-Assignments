Game game;

void setup() {
  size(900, 900 );
  frameRate(10);
  game = new Game(22, 22, 5, 7);
}

void draw() {
  game.update();
  background(0);
  int[][] board = game.getBoard();
  //Løber først gennem two-dim-arrayet på y-aksen
  for (int y = 0; y < game.getHeight(); y++) {
    //Løber derefter igennem two-dim-arrayet på x-aksen for hver index på y-aksen
    for (int x = 0; x < game.getWidth(); x++) {
      //Giver de forskellige objekter farver (Player, enemies, food)
      //Player1 blå
      if (board[x][y] == 1) {
        fill(0, 0, 255); 
        //Player2 lilla
      } else if (board[x][y] == 2) {
        fill(150, 50, 100);
        //Enemies rød
      } else if (board[x][y] == 3) {
        fill(255, 0, 0);
        //Food grøn
      } else if (board[x][y] == 4) {
        fill(0, 255, 0);
        //Tomt feldt sort
      } else if (board[x][y] == 0) {
        fill(0, 0, 0);
      }
      //Hvis player2 dør
      if (game.getPlayer1Life() == 0) {
        board[game.player1.getX()][game.player1.getY()] = 0;
      }
      //Hvis player2 dør
      if (game.getPlayer2Life() == 0) {
        board[game.player2.getX()][game.player2.getY()] = 0;
      }
      stroke(255);
      rect(x*40, y*40, 40, 40);
    }
  }
  fill(255);
  text("Player1 Life: " + game.getPlayer1Life(), 22, 22);
  text("Player2 Life: " + game.getPlayer2Life(), 750, 22);
}

void keyPressed() {
  game.onKeyPressed(key);
}

void keyReleased() {
  game.onKeyReleased(key);
}
