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
    
    ship.collisionListener = this;
  }
  
  public void onCollision(CollisionEvent event) {
    event.preventDefault();
    ship.position.set(respawnPoint);
  }
  
}
