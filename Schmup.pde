import processing.sound.*;

SoundFile sound;

Game game = new Game();
Player player;

public void setup() {
  size(800,800);
  randomSeed(5);
  smooth();
  

  sound = new SoundFile(this, "39459__the-bizniss__laser.wav");


  Emitter s = new Emitter();
  game.entities.add(s);
  
  player = new Player();
  
}

public void draw() {
  game.update();
  game.draw();

}