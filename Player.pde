class Player implements CollisionListener {
  int lives = 3;
  PVector respawnPoint = new PVector();
  Ship ship;
  
  public Player() {
    respawnPoint.x = 400;
    respawnPoint.y = 700;
    
    ship = new Ship();
    ship.alive = true;
    ship.friendly = true;
    ship.position.set(respawnPoint);
    ship.controllers.add(new KeyboardController(ship));
    game.entities.add(ship);
    game.friendlyShips.add(ship);
    
    ship.weapon = new Trident();
    ship.weapon.period = 0.25;
    
    ship.collisionListener = this;
  }
  
  public void onCollision(CollisionEvent event) {
    event.preventDefault();
    ship.position.set(respawnPoint);
    lives--;
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
    text("393993", width - 10, 30);
    
    text("Freme Rate", width - 10, 70);
    text(frameRate, width - 10, 90);
  }
}