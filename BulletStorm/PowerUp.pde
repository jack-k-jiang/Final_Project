class PowerUp{
    PVector powerUp;
    int pUpTimer = 0;
    int pDuration = 10;
    int pWidth = 50;
    int pHeight = 50;
    int type = 0;
    boolean buffed = false;
    
    PowerUp(){
       powerUp = new PVector(int(random(width/2)),int(random(height/2))); 
       pWidth = 50;
       pHeight = 50;
    }

    void update(){
        if (isTouching(player, this)){
            
        }
    }

    void newPowerUp(){
        powerUp = new PVector(int(random(width/2)), int(random(height/2)));
        type = int(random(4));
    }

    void drawPowerUp(){
        fill(255,255,0);
        rect(powerUp.x,powerUp.y,50,50);
    }

    boolean isTouching(Player player, PowerUp powers) {
     if (player.x + player.size >= powers.powerUp.x &&    // r1 right edge past r2 left
      player.x <= powers.powerUp.x + powers.pWidth &&    // r1 left edge past r2 right
      player.y + player.size >= powers.powerUp.y &&    // r1 top edge past r2 bottom
      player.y <= powers.powerUp.y + powers.pHeight) {    // r1 bottom edge past r2 top
      return true;
    }
    return false;
    }
}
