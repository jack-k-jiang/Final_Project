class Enemy {
  int health;
  int attack;
  int speed;
  int size = 50;
  color c = color(255,0,0);   
  float x,y;
  int vx;
  int vy;
  float eWidth;
  float eHeight;
  float attackRate;
  ArrayList<enemyBullet> bullets = new ArrayList<enemyBullet>();
   
  Enemy(float x, float y, int h, int a, int s, int eWidth, int eHeight) {
    this.x = x;
    this.y = y;
   health = h;
   attack = a;
   speed = s;
   this.eWidth = eWidth;
   this.eHeight = eHeight;
   attackRate = 30;
  }
  
  boolean isTouching(Bullet bullet, Enemy enemy) {
     if (bullet.pos.x + bullet.bWidth >= enemy.x &&    // r1 right edge past r2 left
      bullet.pos.x <= enemy.x + enemy.eWidth &&    // r1 left edge past r2 right
      bullet.pos.y + bullet.bHeight >= enemy.y &&    // r1 top edge past r2 bottom
      bullet.pos.y <= enemy.y + enemy.eHeight) {    // r1 bottom edge past r2 top
        bullet.firstTouch = false;
        return true;
  }
  return false;
  }
  
  boolean isTouching(Player player, Enemy enemy) {
     if (player.x + player.size >= enemy.x &&    // r1 right edge past r2 left
      player.x <= enemy.x + enemy.eWidth &&    // r1 left edge past r2 right
      player.y + player.size >= enemy.y &&    // r1 top edge past r2 bottom
      player.y <= enemy.y + enemy.eHeight) {    // r1 bottom edge past r2 top

        return true;
  }
  return false;
  }
  
  
}

class Octopus extends Enemy {
  PImage img = loadImage("left-octopus.png");
  PImage img1 = loadImage("right-octopus.png");
  PImage temp = img;
  public Octopus(float x, float y, int h, int a, int s, int eWidth, int eHeight) {
    super(x, y, h, a, s, eWidth, eHeight);
      }
  
  
  void update() {
    if (health>0) {
    attackRate++;
    

    if (player.x + player.size < x) {
      temp = img;
      x -= speed;
    }
    
    else if (player.x > x + eWidth) {
      temp = img1;
      x += speed;
    }
    
    if (health>0) {
      image(temp, x,y, eWidth, eHeight);
    }

    
    if (attackRate >= 30 && health > 0 && (isTouching(player, this))) { 
      attackRate = 0;
      player.health-=attack;
      System.out.println("player health: "+player.health);
    }
    
    for (int i = 0;i < bullets.size();i++) {
      Bullet bullet = bullets.get(i);
      if (bullet.firstTouch && isTouching(bullet, this)) {
         health-=player.attack;
      }
    }
    
  
    }
  }
  }

  class Airship extends Enemy {
    PImage img = loadImage("left-airship.png");
    PImage img1 = loadImage("right-airship.png");
    PImage temp = img1;
      public Airship(float x, float y, int h, int a, int s, int eWidth, int eHeight) {
          super(x, y, h, a, s, eWidth, eHeight);
      }

      void update() {
        if (health>0) {
          if (x+eWidth+speed > width) {
            x = width-eWidth;
            speed = -1 * speed;
            temp = img;
          }

          else if (x + vx < -1) {
            speed = -1 * speed;
            x  = 0;
            temp = img1;
          }
          else {
          image(temp, x, y, eWidth, eHeight);
          x+=speed;
          }

        bullets.add(new enemyBullet(this));
        }
        for (int i = bullets.size() - 1; i >= 0 ; i--) {
          enemyBullet bullet = bullets.get(i);
          bullet.update();
          if (bullet.pos.x < 0 || bullet.pos.x > width || bullet.pos.y < 0 || bullet.pos.y > height){
            bullets.remove(i);
          }

        }


      }


  }
  
