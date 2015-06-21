import processing.sound.*;

SoundFile sound;
SoundFile sound2;
SoundFile sound3;

Game game = new Game();
Stage stage = new Stage();
Player player;

public void setup() {
  size(800,800,P3D);
  randomSeed(5);
  smooth();
  

  sound = new SoundFile(this, "39459__the-bizniss__laser.wav");
  sound2 = new SoundFile(this, "47252__nthompson__bad-explosion.wav");
  sound3 = new SoundFile(this, "18-fingers_in_the_noise-elixir.mp3");
  sound3.play();          
  
  Emitter e = new Emitter();
  game.entities.add(e);
    
  Ship s = new Ship();
  s.position = new PVector(400, 100);
  s.controllers.add(new DownController(s));
  s.controllers.add(new StrafeController(s));
  game.pendingAdd.add(s);
  game.enemyShips.add(s);
  
  player = new Player();
  
  stage.ornaments.add(new Starfield());
  stage.ornaments.add(new Planet());
  stage.ornaments.add(new Moon());
  stage.ornaments.add(new Title());
  
}

public void draw() {
  game.update();
  game.draw();

}