ArrayList<PVector> character = new ArrayList<PVector>();
PVector powerUp;
Player player;

void setup() {
  background(173, 216, 230);
  size(1250,750);
  player = new Player(width/2, height - 25, 50);
}

void draw() {
  background(173, 216, 230);
  // Update and display the player
  player.update();
}

void keyPressed() {
  if (keyCode == LEFT) {
    if (player.x > player.size/2)
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
