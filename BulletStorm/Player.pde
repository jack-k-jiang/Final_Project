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
  
  Player(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    vx = 0;
    vy = 0;
    isJumping = false;
    isFalling = false;
    timer = 5;
    jumpForce = -10; // Adjust this value to control the jump height
    fallForce = 0.5; // Adjust this value to control the fall speed
    groundLevel = height - size / 2;
  }
  
  void update() {
    // Update player position based on velocity
    x += vx;
    y += vy;
    if (isJumping) {
      timer--;
      System.out.println(timer);
    }
    // Apply gravity
    if (timer<1) {
      System.out.println("hiiiii");
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
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, size, size);
  }
  
  void moveLeft() {
    vx = -5; // Adjust this value to control the left movement speed
  }
  
  void moveRight() {
    vx = 5; // Adjust this value to control the right movement speed
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
