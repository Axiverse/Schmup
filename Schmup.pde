
Game game = new Game();


public void setup() {
  size(400,300);
  randomSeed(5);
  smooth();

  {
    Emitter s = new Emitter();
    game.entities.add(s);
  }
  
  {
    Ship s = new Ship();
    s.alive = true;
    s.friendly = true;
    s.position.x = 100;
    s.position.y = 50;
    s.controllers.add(new KeyboardController(s));
    game.entities.add(s);
    game.friendlyShips.add(s);
  }
  
}

public void draw() {
  background(255);
  
  game.update();
  game.draw();

}

