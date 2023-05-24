class Enemy {
  int health;
  int attack;
  int speed;
  int size = 50;
  color c = color(255,0,0);   
  float x,y;
   PVector vx;
   PVector vy;
   float eWidth;
   float eHeight;
   
  Enemy(float x, float y, int h, int a, int s, int eWidth, int eHeight) {
    this.x = x;
    this.y = y;
   health = h;
   attack = a;
   speed = s;
   this.eWidth = eWidth;
   this.eHeight = eHeight;
  }
  
  boolean touching(Bullet bullet, Enemy enemy) {
     if (bullet.pos.x + bullet.bWidth >= enemy.x &&    // r1 right edge past r2 left
      bullet.pos.x <= enemy.x + enemy.eWidth &&    // r1 left edge past r2 right
      bullet.pos.y + bullet.bHeight >= enemy.y &&    // r1 top edge past r2 bottom
      bullet.pos.y <= enemy.y + enemy.eHeight) {    // r1 bottom edge past r2 top
        return true;
  }
  return false;
  }
  
  
}

class Octopus extends Enemy {

  public Octopus(float x, float y, int h, int a, int s, int eWidth, int eHeight) {
    super(x, y, h, a, s, eWidth, eHeight);
      }
  
  
  void update() {
      PImage img = loadImage("octopus.png");
      image(img, x,y, eWidth, eHeight);
    System.out.println("health: "+health);
    if (health<=0) c = color(0,0,0);
    if (player.x + player.size/2 < x - size/2) {
      x -= speed;
    }
    
    else if (player.x - player.size/2 > x + size/2) {
      x += speed;
    }
    
    else if (abs((player.x - player.size/2) - (x + size / 2)) <= 25 || abs((player.x + player.size/2) - (x - size / 2)) <= 39.15) { 
      player.health-=attack;
    }
    
    for (int i = 0;i < bullets.size();i++) {
      Bullet bullet = bullets.get(i);
      if (touching(bullet, this)) {
         health-=player.attack;
      }
    }
    
  
  }
  
  
}
