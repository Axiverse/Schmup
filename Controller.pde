class Controller {
  Entity entity;
  
  public Controller(Entity entity) {
    this.entity = entity; 
  }
  
  public void update(float delta) {
    
  }
}

class CircleController extends Controller {
  PVector center = new PVector(40, 40);
  float radius = 20;
  float angularVelocity = 3;
  float theta = 0;
  
  public CircleController(Entity entity) {
    super(entity);
  }

  public void update(float delta) {
    theta += angularVelocity * delta;
    
    entity.position.x = center.x + radius * cos(theta);
    entity.position.y = center.y + radius * sin(theta);
    
    entity.weapon.emit(entity, delta);
  }
}

class KeyboardController extends Controller implements KeyListener {
  public KeyboardController(Entity entity) {
      super(entity);
      keyListeners.add(this);
  }
  
  public void keyPressed(int keyCode) {
    switch (keyCode) {
      case 37: /* left */
        entity.velocity.x = -30;
        entity.velocity.y = 0;
        break;
      case 38: /* up */
        entity.velocity.x = 0;
        entity.velocity.y = -30;
        break;
      case 39: /* right */
        entity.velocity.x = 30;
        entity.velocity.y = 0;
        break;
      case 40: /* down */
        entity.velocity.x = 0;
        entity.velocity.y = 30;
        break;
    }
    
    if (key == ' ') {
      entity.weapon.emit(entity,100);
    }
  }
  
  public void keyReleased(int keyCode) {
    if((keyCode == 37) || (keyCode == 38) || (keyCode == 39) || (keyCode == 40)){
      entity.velocity.x = 0;
      entity.velocity.y = 0;
    }
  }
}

interface KeyListener {
  public void keyPressed(int keyCode);
  public void keyReleased(int keyCode);
}

ArrayList<KeyListener> keyListeners = new ArrayList<KeyListener>();

void keyPressed() {
  for (KeyListener listener : keyListeners) {
    listener.keyPressed(keyCode);
  }
}

void keyReleased() {
  for (KeyListener listener : keyListeners) {
    listener.keyReleased(keyCode);
  }
}
