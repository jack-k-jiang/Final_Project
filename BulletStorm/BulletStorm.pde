PowerUp power;
PFont arcade;
Player player;
Weapon weapon;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
//Timer for functions
HealthBar hb;
static int reloadRate = 0;
boolean start = true;
PImage background;
Level curLvl = new Level(1);
int rldRate = 15;
int lvlTimer = 0;
boolean newLevel = false;

void setup() {
  background(255,255,255);
  background = loadImage("spaceBackground.jpg");
  size(1750, 800);
  power = new PowerUp();
  arcade = createFont("ARCADECLASSIC.TTF",100);
  startScreen();
}

void draw() {
  if (mousePressed && mouseButton == LEFT && start == true){
    player = new Player(width/2, height - 50, 100);
    hb = new HealthBar(player);
    curLvl.runLevel();
    start = false;
    background(255,255,255);
  }
  //while (lvlTimer < 180)
  if (start == false){
    background(background);

    reloadRate++;
    
    // Update and display the player
    player.update();
    power.update();
    if (player.health <= 0){
      start = true;
      endScreen();
      curLvl = new Level(1);
      enemies = new ArrayList<Enemy>();
      return;
    }
    //Update and display the enemy
    if (enemies.size()==0) {
      curLvl = new Level(curLvl.lvl+1);
      curLvl.runLevel();
      newLevel = true;
    }
    if (newLevel == true && lvlTimer < 180){
      fill(255,255,255);
      textAlign(CENTER);
      text("LEVEL " + curLvl.lvl, width/2, height/2);
      strokeWeight(1);
      lvlTimer++;
      start = true;
    }
    else if (lvlTimer >= 180){
      newLevel = false;
      lvlTimer = 0;
    }
    for (int i = 0;i<enemies.size();i++) {
      enemies.get(i).update();
    }
    if (player.health<=0) {
          start = true;
          endScreen();
          curLvl = new Level(1);
          enemies = new ArrayList<Enemy>();
          return;
    }
    //Update and display the healthbar
    hb.update();
    // Shoot weapon
    if (mousePressed && mouseButton == LEFT && reloadRate >= rldRate && player != null){
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
