Entity e = new Entity();


public void setup() {
  size(400,300);
  randomSeed(5);
  smooth();

  e.position.x = 50;
  e.position.y = 50;
  
  //e.acceleration.x = 10;
  e.alive = true;
  
  new KeyboardController(e);
}

public void draw() {
  background(255);
  
  e.draw();
  e.update(1/60f);

}

