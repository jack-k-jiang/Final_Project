class HealthBar {
  PImage fullHeart = loadImage("fullHeart.jpg");
  PImage halfHeart = loadImage("halfHeart.jpg");
  PImage emptyHeart = loadImage("emptyHeart.jpg");
  int hearts; 
  HealthBar(Player player) {
     hearts = int(player.health/10);
  }
  
  public void update() {
      for (int i = 1;i<=10;i++) {
        if (hearts<i) {
          image(emptyHeart,50*i+15, 0, 50, 50);
        }
        else if (i == hearts && hearts%2==1) {
            image(halfHeart, 50*i+15,0, 50, 50);
          }
        else {
          image(fullHeart, 50*i+15, 0, 50, 50);
        }
      }
  }
  
  
  
  
}
