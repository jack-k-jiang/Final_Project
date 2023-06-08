PFont arcade;

PowerUp power;
Player player;
Weapon weapon;

//Arraylists
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Platform> platforms = new ArrayList<Platform>();

//Timer for functions
HealthBar hb;
int reloadRate = 0;
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
  arcade = createFont("ARCADECLASSIC.TTF",150);
  startScreen();
  platforms.add(new Platform(width/2,height-150,150,50));
  platforms.add(new Platform(width/2 - 75,height-250,150,50));
  platforms.add(new Platform(width/2 + 75,height-250,150,50));
  platforms.add(new Platform(width/2,height-350,150,50));
}

void draw() {
  //Start screen
  if (mousePressed && mouseButton == LEFT && start == true && newLevel != true){
    player = new Player(width/2, height - 50, 100, 10, 5, -10);
    hb = new HealthBar(player);
    power = new PowerUp();
    curLvl.runLevel();
    start = false;
    background(255,255,255);
    for (int i = 0;i<platforms.size();i++) {
      platforms.get(i).drawPlatform();
    }
    
  }
  if (newLevel == true && lvlTimer <= 180){
      fill(255,255,255);
      textAlign(CENTER);
      text("LEVEL " + curLvl.lvl, width/2, height/2-50);
      strokeWeight(1);
      lvlTimer++;
      start = true;
    }
    else if (lvlTimer >= 180){
      newLevel = false;
      start = false;
      lvlTimer = 0;
  }
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
    //New lvl runs
    if (enemies.size()==0) {
      curLvl = new Level(curLvl.lvl+1);
      curLvl.runLevel();
      newLevel = true;
    }
    for (int i = 0;i<enemies.size();i++) {
      enemies.get(i).update();
    }

    //Player dies = reset lvl
    if (player.health<=0) {
          start = true;
          endScreen();
          curLvl = new Level(1);
          enemies = new ArrayList<Enemy>();
          rldRate = 15;
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