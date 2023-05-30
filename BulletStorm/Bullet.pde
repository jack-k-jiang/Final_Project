class Bullet {
  PVector pos; 
  float spd;
  float angle;
  float bWidth;
  float bHeight;
  boolean firstTouch;
  
  public Bullet(float fromX, float fromY, float toX, float toY){
    pos = new PVector(fromX, fromY);
    spd = 5;
    angle = atan2(toY - pos.y, toX - pos.x) / PI * 180;
    bWidth = 10;
    bHeight = 10;
    firstTouch = true;
  }

  public void update(){
    if (firstTouch) {
    pos.x += cos(angle/180*PI)*spd;
    pos.y += sin(angle/180*PI)*spd;
    fill(0,255,0);
    rect(pos.x + 25, pos.y, bWidth, bHeight);
    }
  }
}

class enemyBullet extends Bullet{
  public enemyBullet(Enemy enemy){
    pos = new PVector(enemy.x,enemy.y);
    bWidth = 10;
    bHeight = 1000;
    firstTouch = true;
  }

  public void update(Enemy enemy){
    pos.x += enemy.speed;
    pos.y += 0;
    fill(100,0,0);
    rect(pos.x + 50, pos.y, bWidth, bHeight);
  }
}