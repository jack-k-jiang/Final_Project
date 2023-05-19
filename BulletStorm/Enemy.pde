class Enemy {
   private int health;
   private int attack;
   private int speed;
   
  Enemy(int h, int a, int s) {
   health = h;
   attack = a;
   speed = s;
  }
}

class Octopus extends Enemy {
  public Octopus(int h, int a, int s){
    super(h, a, s);
  }
}
