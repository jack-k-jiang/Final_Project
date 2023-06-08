PFont arcade;
PImage[] boss = new PImage[20]; 

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
Level curLvl = new Level(4);
int rldRate = 15;
int lvlTimer = 0;
boolean newLevel = false;
boolean bossLvl = false;
Boss bossB;
boolean victory = false;

void setup() {
  smooth();
  boss[0] = loadImage("boss0.gif");
  boss[1] = loadImage("boss1.gif");
  boss[2] = loadImage("boss2.gif");
  boss[3] = loadImage("boss3.gif");
  boss[4] = loadImage("boss4.gif");
  boss[5] = loadImage("boss5.gif");
  boss[6] = loadImage("boss6.gif");
  boss[7] = loadImage("boss7.gif");
  boss[8] = loadImage("boss8.gif");
  boss[9] = loadImage("boss9.gif");
  boss[10] = loadImage("boss10.gif");
  boss[11] = loadImage("boss11.gif");
  boss[12] = loadImage("boss12.gif");
  boss[13] = loadImage("boss13.gif");
  boss[14] = loadImage("boss14.gif");
  boss[15] = loadImage("boss15.gif");
  boss[16] = loadImage("boss16.gif");
  boss[17] = loadImage("boss17.gif");
  boss[18] = loadImage("boss18.gif");
  boss[19] = loadImage("boss19.gif");
  background(255,255,255);
  background = loadImage("spaceBackground.jpg");
  size(1750, 800);
  power = new PowerUp();
  arcade = createFont("ARCADECLASSIC.TTF",150);
  startScreen();
  platforms.add(new Platform(width/2-225,height-150,450,50));
  platforms.add(new Platform(width/2 - 675,height-355,450,50));
  platforms.add(new Platform(width/2 + 225,height-355,450,50));
  platforms.add(new Platform(width/2-225,height-550,450,50));
  bossB = new Boss(450,25);
}

void draw() {
  if (victory == false){
  //Start screen
  if (mousePressed && mouseButton == LEFT && start == true && newLevel != true){
    player = new Player(width/2, height - 50, 1000, 100, 5, -10);
    hb = new HealthBar(player);
    power = new PowerUp();
    curLvl.runLevel();
    start = false;
    background(255,255,255);

    
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
      for (int i = 0;i<platforms.size();i++) {
      platforms.get(i).drawPlatform();
    }
    reloadRate++;
    
    
    if (player.health <= 0){
      start = true;
      endScreen();
      curLvl = new Level(1);
      enemies = new ArrayList<Enemy>();
      return;
    }
    //New lvl runs
    if (enemies.size()==0) {
      if (curLvl.lvl+1<4){
        curLvl = new Level(curLvl.lvl+1);
        curLvl.runLevel();
        newLevel = true;
      }
      else {
        bossLvl = true;
      }
    }
    if (bossLvl) {
      bossB.update();
    }
    else {
      for (int i = 0;i<enemies.size();i++) {
        enemies.get(i).update();
      }
    }
    // Update and display the player
    player.update();
    power.update();
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
  textSize(50);
  text("W,A,S,D to move", width/2, height/2 + 100);
  text("LEFT CLICK TO SHOOT", width/2, height/2 + 200);
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

void victoryScreen(){
  textFont(arcade);
  background(0,0,0);
  fill(255,255,255);
  textAlign(CENTER);
  text("WINNER WINNER", width/2, height/2);
  textSize(50);
  text("CHICKEN DINNER", width/2, height/2 + 100);
  strokeWeight(1);
  return;
}
