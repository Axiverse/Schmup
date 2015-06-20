import processing.sound.*;

SoundFile sound;
SoundFile sound2;
SoundFile sound3;

Game game = new Game();
Player player;

public void setup() {
  size(800,800);
  randomSeed(5);
  smooth();
  

  sound = new SoundFile(this, "39459__the-bizniss__laser.wav");
  sound2 = new SoundFile(this, "47252__nthompson__bad-explosion.wav");
  sound3 = new SoundFile(this, "18-fingers_in_the_noise-elixir.mp3");
  sound3.play();          
  
  Emitter s = new Emitter();
  game.entities.add(s);
  
  player = new Player();
  
}

public void draw() {
  game.update();
  game.draw();

}