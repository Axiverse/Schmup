
Game game = new Game();
Player player;

public void setup() {
  size(800,800);
  randomSeed(5);
  smooth();

  {
    Emitter s = new Emitter();
    game.entities.add(s);
  }
  
  player = new Player();
  
}

public void draw() {
  game.update();
  game.draw();

}

