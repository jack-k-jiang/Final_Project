class Enemy {
  int health;
  int attack;
  int speed;
  float x,y;
  int size = 50;
  color c = color(255,0,0);
  PImage img;
   
   PVector vx;
   PVector vy;
   
  Enemy(float x, float y, int h, int a, int s) {
    this.x = x;
    this.y = y;
   health = h;
   attack = a;
   speed = s;
  }
}

class Octopus extends Enemy {
  img = loadImage("dog.jpg");
  image(img, 5, 5);
  public Octopus(float x, float y, int h, int a, int s){
    super(x, y, h, a, s);
  }
  
  
  void update() {
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
      if () {
         health-=player.attack;
      }
    }
    
    fill(c);
    circle(x,y,50);
  }
}
