class Controller {
  Entity entity;
  
  public Controller(Entity entity) {
    this.entity = entity; 
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
        entity.velocity.x = -10;
        entity.velocity.y = 0;
        break;
      case 38: /* up */
        entity.velocity.x = 0;
        entity.velocity.y = -10;
        break;
      case 39: /* right */
        entity.velocity.x = 10;
        entity.velocity.y = 0;
        break;
      case 40: /* down */
        entity.velocity.x = 0;
        entity.velocity.y = 10;
        break;
    }
  }
  
  public void keyReleased(int keyCode) {
    entity.velocity.x = 0;
    entity.velocity.y = 0;
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
