class HealthBar {
  PImage healthBar = loadImage("healthbar.png");
  float healthPoints; 
  float health;
  HealthBar(Player player) {
     healthPoints = player.health*4;
     health = player.health;
  }
  
  public void update() {
    image(healthBar,0,0,healthPoints,75); 
    fill(#d30100);
    noStroke();
    rect(114.4,15.5,health*1.5,66.75);
  }
  
  
  
  
}
