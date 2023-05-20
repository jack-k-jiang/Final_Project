ArrayList<PVector> character = new ArrayList<PVector>();
PVector powerUp;
Player player;

void setup() {
  background(173, 216, 230);
  size(1700, 800);
  player = new Player(width/2, height - 25, 50);
}

void draw() {
  background(173, 216, 230);
  player.update();
  
}

void drawPowerUp(){
  
}

void newPowerUp(){
  
}

void keyPressed() {
  if (keyCode == LEFT) {
    player.moveLeft();
  } else if (keyCode == RIGHT) {
    player.moveRight();
  } else if (keyCode == UP) {
    player.jump();
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) {
    player.stopMoving();
  }
}
