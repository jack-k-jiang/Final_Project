class Enemy {
  int health;
  int attack;
  int speed;
  float x,y;
  int size = 50;
  color c = color(255,0,0);
   
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
  public Octopus(float x, float y, int h, int a, int s){
    super(x, y, h, a, s);
  }
  
  void update() {
    if (player.x + player.size/2 < x - size/2) {
      x -= speed;
    }
    
    else if (player.x - player.size/2 > x + size/2) {
      x += speed;
    }
    
    else if (abs((player.x - player.size/2) - (x + size / 2)) <= 25 || abs((player.x + player.size/2) - (x - size / 2)) <= 25) { 
      player.health-=attack;
      c = #2596BE;
    }
    System.out.println(player.x);
    System.out.println(x);
    fill(c);
    circle(x,y,50);
  }
}
