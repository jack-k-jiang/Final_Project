PVector powerUp;
Player player;
Weapon weapon;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
//Timer for functions
Octopus Greg;
int reloadRate = 0;
boolean start = true;

void setup() {
<<<<<<< HEAD
=======
  background(173, 216, 230);
  PImage img = loadImage("octopus.jpg");

>>>>>>> b681913de9d02db5cbbb93fde0bdab10b01ea4cd
  size(1250,750);
  startScreen();
}

void draw() {
  if (mousePressed && mouseButton == LEFT && start == true){
     background(173, 216, 230);
     player = new Player(width/2, height - 25, 50);
     Greg = new Octopus(width/4, height - 25, 100, 10, 4);
     start = false;
  }
  if (start == false){
  background(173, 216, 230);
  reloadRate++;
  // Update and display the player
  player.update();
  //Update and display the enemy
  Greg.update();
  // Shoot weapon
  if (mousePressed && mouseButton == LEFT && reloadRate >= 20 && player != null){
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
  background(173, 216, 230);
  textSize(100);
  fill(173,216,230);
  stroke(0,0,0);
  strokeWeight(4);
  rect(width/2-100,height/2 - 80,215,100);
  fill(0,0,0);
  text("PLAY", width/2-100, height/2);
  strokeWeight(1);
}
