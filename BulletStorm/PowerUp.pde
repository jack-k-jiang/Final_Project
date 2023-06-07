class PowerUp{
    PVector powerUp;
    int timer = second();
    int pUpTimer = 0;
    int pDuration = 600;
    int pInterval = 1500;
    int pWidth = 50;
    int pHeight = 50;
    int type = 0;
    boolean buffed = false;
    boolean playerTouched = false;
    
    PowerUp(){
       powerUp = new PVector(int(random(width/2)), height - 50 - int(random(100))); 
       pWidth = 50;
       pHeight = 50;
    }

    void update(){
        if (isTouching(player, this)){
            switch(type){
            case 0:
                if (buffed == false) {
                    player.jumpForce -= 5;
                }
                buffed = true;
                playerTouched = true;
                break;
            case 1:
                if (buffed == false) {
                    player.speed += 5;
                }
                buffed=true;
                playerTouched = true;
                break;
            case 2:
                if (buffed == false) {
                player.health += 10;
                }
                buffed=true;
                playerTouched = true;
                break;
            case 3:
                if (buffed == false) {
                    rldRate -= 10;
                }
                buffed=true;
                playerTouched = true;
                break;
            case 4:
                if (buffed == false ) {
                    player.health+=10;
                    playerTouched = true;
                }
                else if (player.health == 95 && buffed == false){
                player.health+=5;
                playerTouched = true;
                }
            
                break;
            }
        }
        else {
            if (playerTouched == false){
                drawPowerUp();
            }
            else {
                if (playerTouched){
                    pUpTimer++;
                    if (pUpTimer == pDuration){
                        player = new Player(player.x,player.y,player.health);
                    }
                    if (pUpTimer >= pInterval){
                        pUpTimer = 0;
                        playerTouched = false;
                        newPowerUp();
                        buffed = false;
                    }
                }
            }
        }
    }

    void newPowerUp(){
        powerUp = new PVector(int(random(width/2)), height - 50 - int(random(100)));
        type = int(random(5));
    }

    void drawPowerUp(){
        switch(type){
          case 0:
            fill(0,0,0);
            break;
          case 1:
            fill(0,255,0);
            break;
          case 2:
            fill(0,0,255);
            break;
          case 3:
            fill(255,255,0);
            break;
          case 4:
            fill(200,0,0);
            break;
        }
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