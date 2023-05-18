
void setup() {
  background(200);
  size(1080, 720);
  noStroke();
  fill(0);
}

void draw() {
  background(200);
  drawSnake();
  drawFood();
 
  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();  
  }
}

// draw the food item (square) which size is tha variable size

 

void reset() {
  spd = 20;
  len = 5;
  pos = new PVector(40, 200);
  dir = new PVector(0, 3);
  newFood();
  snake = new ArrayList<PVector>();
}

void keyPressed() {
  // if UP is pressed => dir = new PVector(...)
  if (keyCode == UP){
    if (dir.y == 1) {dir.y = 1;}
    else
      dir.y = 0;
  }
  else if (keyCode == DOWN){
    if (dir.y == 0) {dir.y = 0;}
    else
    dir.y = 1;
  }
  else if (keyCode == LEFT){
    if (dir.y == 3) {dir.y = 3;}
    else
    dir.y = 2;
  }
  else if (keyCode == RIGHT){
    if (dir.y == 2) {dir.y = 2;}
    else
    dir.y = 3;
  }
  else
    dir.y = 4;
  // same thing for DOWN, LEFT, RIGHT
  // if '+' is pressed, increase the size of the squares (and recalculate w and h)
  // same thing for '-'
  // when 'm' is pressed, change the mode -> ONLY IF YOU IMPLEMENT BOTH MODES
}
