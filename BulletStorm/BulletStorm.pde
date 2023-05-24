PVector powerUp;
Player player;
Weapon weapon;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
//Timer for functions
int startTime;
Octopus Greg;
int reloadRate = 0;

void setup() {
  background(173, 216, 230);
  PImage img = loadImage("octopus.jpg");

  size(1250,750);
  player = new Player(width/2, height - 25, 50);
  Greg = new Octopus(width/4, height - 95, 100, 10, 4, 95, 95);
}

void draw() {
  background(173, 216, 230);
  reloadRate++;
  // Update and display the player
  player.update();
  //Update and display the enemy
  Greg.update();
  // Shoot weapon
  if (mousePressed && mouseButton == LEFT && reloadRate >= 20){
    reloadRate = 0;
    bullets.add(new Bullet());
  }
  for (int i = bullets.size() - 1; i >= 0 ; i--) {
    Bullet bullet = bullets.get(i);
    bullet.update();
    if (bullet.pos.x < 0 || bullet.pos.x > width || bullet.pos.y < 0 || bullet.pos.y > height){
        bullets.remove(i);
    }
  }
}

void keyPressed() {
  if (key == 'a') {
      player.moveLeft();
  } else if (key == 'd') {
      player.moveRight();
  } else if (key == 'w') {
    player.jump();
  }
}

void keyReleased() {
  if (key == 'a' || key == 'd') {
    player.stopMoving();
  }
}
