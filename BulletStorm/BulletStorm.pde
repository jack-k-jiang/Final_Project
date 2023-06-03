PVector powerUp;
PFont arcade;
Player player;
Weapon weapon;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
//Timer for functions
Alien Greg;
Alien Eric;
UFO Jack;
HealthBar hb;
static int reloadRate = 0;
boolean start = true;
PImage background;
Level curLvl = new Level();

void setup() {
  background(255,255,255);
  background = loadImage("spaceBackground.jpg");
  size(1300, 800);
  arcade = createFont("ARCADECLASSIC.TTF",100);
  startScreen();
}

void draw() {
  if (curLvl.lvl == 1) {
  if (mousePressed && mouseButton == LEFT && start == true){
    player = new Player(width/2, height - 50, 50);
    hb = new HealthBar(player);
    Greg = new Alien(width/2, height - 95, 50, 10, 4, 95, 95);
    Eric = new Alien(width/4, height - 95, 50, 10, 4, 95, 95);
    Jack = new UFO(width/4, 0, 50, 10, 4, 150, 95);
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
    Jack.update();
    hb.update();
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
    if (player.health <= 0){
      endScreen();
      start = true;
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
  textFont(arcade);
  background(0,0,0);
  fill(255,255,255);
  textAlign(CENTER);
  text("PLAY", width/2, height/2);
  strokeWeight(1);
}

void endScreen(){
  textFont(arcade);
  background(0,0,0);
  fill(255,255,255);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  textSize(50);
  text("PRESS ANYWHERE TO PLAY AGAIN", width/2, height/2 + 100);
  strokeWeight(1);
}
