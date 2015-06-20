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
  boolean directions[] = new boolean[4];//L,U,R,D
  boolean fire = false;
  float speed = 100;
  
  public KeyboardController(Entity entity) {
      super(entity);
      keyListeners.add(this);
  }
  
  public void update(float delta) {
    if (entity.weapon != null) {
      if (fire)
        entity.weapon.emit(entity, delta);
      else 
        entity.weapon.roll(delta);
    }
  }
  
  public void keyPressed(int keyCode) {
    switch (keyCode) {
      case 37: /* left */
        if (!directions[0]) {
          directions[0] = true;
          entity.velocity.x += -speed;
        }
        break;
      case 38: /* up */
        if (!directions[1]) {
          directions[1] = true;
          entity.velocity.y += -speed;
        }
        break;
      case 39: /* right */
        if (!directions[2]) {
          directions[2] = true;
          entity.velocity.x += speed;
        }
        break;
      case 40: /* down */
        if (!directions[3]) {
          directions[3] = true;
          entity.velocity.y += speed;
        }
        break;
    }
    
    if (key == ' ') {
      fire = true;
      entity.weapon.emit(entity, 0);
    }
  }
  
  public void keyReleased(int keyCode) {
    switch (keyCode) {
      case 37: /* left */
        directions[0] = false;
        entity.velocity.x -= -speed;
        break;
      case 38: /* up */
        directions[1] = false;
        entity.velocity.y -= -speed;
        break;
      case 39: /* right */
        directions[2] = false;
        entity.velocity.x -= speed;
        break;
      case 40: /* down */
        directions[3] = false;
        entity.velocity.y -= speed;
        break;
    }
    
    if (key == ' ') {
      fire = false;
    }
  }
}

