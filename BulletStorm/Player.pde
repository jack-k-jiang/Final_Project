class Player {
  // Player position
  float x, y;
  
  // Player velocity
  float vx, vy;
  
  // Player size
  float size;
  
  // Jump variables
  boolean isJumping;
  boolean isFalling;
  float jumpForce;
  float fallForce;
  float groundLevel;
  int timer;
  
  //Player stats
  float health;
  float attack;
  float speed;

  boolean isPowered = false;
  
  boolean isTouching(Player player, Platform platform) {
     if (player.x + player.size >= platform.x &&    // r1 right edge past r2 left
      player.x <= platform.x + platform.width &&    // r1 left edge past r2 right
      player.y + player.size >= platform.y &&    // r1 top edge past r2 bottom
      player.y <= platform.y + platform.height) {    // r1 bottom edge past r2 top
        return true;
  }
  return false;
  }
  
  Player(float x, float y, float health, float attack, float speed, float jumpForce) {
    this.x = x;
    this.y = y;
    this.health = health;
    this.attack = attack;
    this.speed = speed;
    this.jumpForce = jumpForce; // Adjust this value to control the jump height
    size = 50;
    vx = 0;
    vy = 0;
    isJumping = false;
    isFalling = false;
    timer = 5;
    fallForce = 0.5; // Adjust this value to control the fall speed
    groundLevel = height - size;
  }
  
  void update() {
    if (player.health <= 0) {
    }
    else {
      //Checking if it's at borders
      for (int i = 0;i<platforms.size();i++) {
        if (isTouching(this,platforms.get(i))) {

        }
      }
      if (x + vx < -1) {
        x = 0;
      }
      else if (x+size + vx > width) {
        x = width-size;
      }
      else {
      x += vx;
      }
      y += vy;

      if (isJumping) {
        timer--;
      }
      // Apply gravity
      if (y < groundLevel || timer<1) {
        vy += fallForce; // Adjust this value to control the fall speed
      }
      
      // Check if player hits the ground
      if (y >= groundLevel) {
        timer = 5;
        y = groundLevel;
        vy = 0;
        isJumping = false;
        isFalling = false;
      } else {
        isFalling = true;
      }
      
      // Display the player
      fill(255,0,0);
      rect(x, y, 50, 50);
    
  }
  }
  
  void moveLeft() {
      
      vx = -speed; // Adjust this value to control the left movement speed

  }
  
  void moveRight() {
      vx = speed; // Adjust this value to control the right movement speed
  }
  
  void stopMoving() {
    vx = 0;
  }
  
  void jump() {
    if (!isJumping && !isFalling) {
      vy = jumpForce;
      isJumping = true;
    }
  }
}
