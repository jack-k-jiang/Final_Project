class Level {
  int lvl;
  int numAliens;
  int numUFOs;
  Level(int level) {
    lvl = level;
    numAliens = int(random(1,1+lvl));
    numUFOs = int(random(1,1+lvl));
  }
  
  void runLevel() {
     for (int i = 0;i<numAliens;i++) {
       Alien alien = new Alien(random(0,width-94), height - 95, 50+int(random(0+lvl-1,lvl+1)), 10+int(random(0+lvl-1,lvl+1)), 4+int(random(0+lvl-1,lvl+1)), 95, 95);
       enemies.add(alien);
     }
     
     for (int j = 0;j<numUFOs;j++) {
       UFO ufo = new UFO(random(0,width-94), 0, 50+int(random(0+lvl-1,lvl+1)), 10+int(random(0+lvl-1,lvl+1)), 5+int(random(0+lvl-1,lvl+1)), 150, 95);
       enemies.add(ufo);
     }
  }
}
