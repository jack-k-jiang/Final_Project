class HealthBar {
  float healthPoints; 
  float y;
  HealthBar(Player player) {
     healthPoints = player.health;
     y = player.health * 1.5;
  }
  
  public void update() {
      rect(0,y,50,100);
  }
  
  
  
  
}
