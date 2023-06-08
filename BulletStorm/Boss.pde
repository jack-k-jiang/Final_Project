class Boss{
    int health;
    int attack;
    PImage boss; 
    float eWidth;
    float eHeight;
    int x,y;

    Boss(int hp, int atk){
        this.health = hp;
        this.attack = attack;
    }

    boolean isTouching(Bullet bullet, Boss boss) {
     if (bullet.pos.x + bullet.bWidth >= boss.x &&    // r1 right edge past r2 left
        bullet.pos.x <= boss.x + boss.eWidth &&    // r1 left edge past r2 right
        bullet.pos.y + bullet.bHeight >= boss.y &&    // r1 top edge past r2 bottom
        bullet.pos.y <= boss.y + boss.eHeight) {    // r1 bottom edge past r2 top
        bullet.firstTouch = false;
        return true;
    }
    return false;
    }
}