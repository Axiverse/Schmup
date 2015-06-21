class Player implements CollisionListener, KeyListener {
  PVector respawnPoint = new PVector();
  ArrayList<Weapon> weapons = new ArrayList<Weapon>();
  
  Ship ship;
  
  int lives = 3;
  
  int score = 0;
  int multiplier = 1;
  
  public Player() {
    keyListeners.add(this);
    
    respawnPoint.x = 400;
    respawnPoint.y = 700;
    
    ship = new Ship();
    ship.alive = true;
    ship.friendly = true;
    ship.position.set(respawnPoint);
    ship.controllers.add(new KeyboardController(ship));
    game.entities.add(ship);
    game.friendlyShips.add(ship);
    
    weapons.add(ship.weapon);
    weapons.add(new Trident());
    weapons.add(new Rapid());

    ship.weapon.period = 0.25;
    
    ship.collisionListener = this;
  }
  
  public void onCollision(CollisionEvent event) {
    event.preventDefault();
    ship.position.set(respawnPoint);
    lives--;
    
    multiplier = 1;
  }
  
  PFont font = createFont("Eurostile", 16);
  public void drawUi() {
    fill(0);
    noStroke();
    
    rect(0, 0, 150, 800);
    
    rect(650, 0, 150, 800);
    
    fill(255);
    textFont(font);
    textAlign(LEFT, TOP);
    text("Lives", 10, 10);
    text(lives, 10, 30);
    
    
    textAlign(RIGHT, TOP);
    text("Score", width - 10, 10);
    text(score, width - 10, 30);
    
    text("Freme Rate", width - 10, 70);
    text(frameRate, width - 10, 90);
    
    text("Entities", width - 10, 130);
    text(game.entities.size(), width - 10, 150);
  }
  
  public void keyPressed(int keyCode) {
    if (key >= '1' && key <= '9') {
      int index = key - '1';
      
      print(index);
      if (weapons.size() > index) {
        ship.weapon = weapons.get(index);
      }
    }
  }
  
  public void keyReleased(int keyCode) {
    
  }
}