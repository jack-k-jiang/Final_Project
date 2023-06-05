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
  
  
  Player(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    vx = 0;
    vy = 0;
    isJumping = false;
    isFalling = false;
    speed = 5;
    health = 100;
    attack = 10;
    timer = 5;
    jumpForce = -10; // Adjust this value to control the jump height
    fallForce = 0.5; // Adjust this value to control the fall speed
    groundLevel = height - size;
  }
  
  void update() {
    if (player.health <= 0) {
    }
    else {
    // Update player position based on velocity
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
    if (timer<1) {
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
