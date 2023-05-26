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
    fill(0,0,255);
    rect(pos.x, pos.y, bWidth, bHeight);
    }
  }
}
