class Boss{   
    int health;
    int attack;
    float eWidth;
    float eHeight;
    int x,y;
    int bossTimer = 0;
    int bossTimerWhileI = 0;
    int invulnerableInterval;
    boolean invulnerable = false; 

    

    Boss(int hp, int atk){
        this.health = hp;
        this.attack = atk;
        eWidth = 40;
        eHeight = 50;
        x = width/2;
        y = height/2;
    }
    
    void update(){
        imageMode(CENTER);
        image(boss[frameCount%20], x,y);
        if (bossTimer >= 1200){
            invulnerable = true;
            if (bossTimerWhileI == 600) {
                invulnerable = false;
                bossTimer = 0;
            }
            bossTimerWhileI++;
        }
        if (invulnerable){
            tint(255, 150);
        }
        else {
            noTint();
            for (int i = 0;i < bullets.size();i++) {
                Bullet bullet = bullets.get(i);
            if (bullet.firstTouch && isTouching(bullet, this)) {
                health-=player.attack;
            }
            }
            if (health <= 0){
              victory = true;
              victoryScreen();
            }
        }
        bossTimer++;
        imageMode(CORNER);
    }

    boolean isTouching(Bullet bullet, Boss boss) {
     if (bullet.pos.x + bullet.bWidth >= boss.x - 65 &&    // r1 right edge past r2 left
        bullet.pos.x <= boss.x + boss.eWidth   &&    // r1 left edge past r2 right
        bullet.pos.y + bullet.bHeight >= boss.y - 60 &&    // r1 top edge past r2 bottom
        bullet.pos.y <= boss.y + boss.eHeight - 30) {    // r1 bottom edge past r2 top
        bullet.firstTouch = false;
        return true;
    }
    return false;
    }
}
