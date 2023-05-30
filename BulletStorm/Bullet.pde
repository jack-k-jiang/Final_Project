class Bullet {
  PVector pos; 
  PVector mouse; 
  float spd;
  float angle;
  float bWidth;
  float bHeight;
  boolean firstTouch;
  
  public Bullet(){
    pos = new PVector(player.x, player.y);
    mouse = new PVector(mouseX, mouseY);
    spd = 5;
    angle = atan2(mouse.y - pos.y, mouse.x - pos.x) / PI * 180;
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
    pos = new PVector(enemy.x,enemy.y+enemy.eHeight);
    bWidth = 10;
    bHeight = 1000;
    firstTouch = true;
  }

  public void update(Enemy enemy){
    pos.x += enemy.speed;
    pos.y += 0;
      image(enemy.laser,enemy.x+enemy.eWidth/2 - 25,enemy.y+enemy.eHeight,50,height - enemy.eHeight);
    
    //rect(pos.x+enemy.eWidth/2, pos.y, bWidth, bHeight);
  }
}
