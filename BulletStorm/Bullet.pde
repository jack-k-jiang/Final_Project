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
    pos.x += cos(angle/180*PI)*spd;
    pos.y += sin(angle/180*PI)*spd;
    fill(0,0,255);
    rect(pos.x, pos.y, bWidth, bHeight);
  }
}

class EnemyBullet{
}
