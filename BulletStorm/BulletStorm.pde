PVector powerUp;
Player player;
Weapon weapon;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
//Timer for functions
Octopus Greg;
Octopus Eric;
int reloadRate = 0;
boolean start = true;
PImage background;

void setup() {
  background(255,255,255);
  background = loadImage("background1.gif");
  size(1200, 800);
  
  startScreen();
}

void draw() {
  if (mousePressed && mouseButton == LEFT && start == true){
    player = new Player(width/2, height - 50, 50);
    Greg = new Octopus(width/2, height - 95, 50, 10, 4, 95, 95);
     Eric = new Octopus(width/4, height - 95, 50, 10, 4, 95, 95);
    start = false;
    background(255,255,255);
  }
  if (start == false){
      background(background);
  reloadRate++;
  // Update and display the player
  player.update();
  //Update and display the enemy
  Greg.update();
  Eric.update();
  // Shoot weapon
  if (mousePressed && mouseButton == LEFT && reloadRate >= 10 && player != null){
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
  if (player.health == 0){
    endScreen();
    start = true;
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

void startScreen(){
  background(255,255,255);
  textSize(100);
  fill(0,0,0);
  textAlign(CENTER);
  text("PLAY", width/2, height/2);
  strokeWeight(1);
}

void endScreen(){
  background(255,255,255);
  textSize(100);
  fill(0,0,0);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  textSize(50);
  text("PRESS ANYWHERE TO PLAY AGAIN", width/2, height/2 + 100);
  strokeWeight(1);
}
