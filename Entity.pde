class Entity
{
  PVector position = new PVector(); 
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  PVector temp = new PVector();
  
  boolean alive = false;
  boolean friendly = false;
  float radius = 8;
  
  ArrayList<Controller> controllers = new ArrayList<Controller>();
  Weapon weapon = new Weapon();
  
  public Entity() {
    
  }
  
  public void draw() {
    ellipseMode(CENTER);
    
    if (friendly)
      fill(0, 255, 255);
    else
      fill(255, 255, 0);
    
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
  
  public void update(float delta) {
    if (alive) {
       
       temp.set(acceleration);
       temp.mult(delta);
       velocity.add(temp);
       
       temp.set(velocity);
       temp.mult(delta);
       position.add(temp);
       
       
       
    }
    
    for (Controller controller : controllers) {
      controller.update(delta);
    }
    
    if (position.x < 0 || position.y < 0 || position.x > width || position.y > height) {
      game.pendingRemove.add(this);
    }
  }
  
  public void onCollision(CollisionEvent event) {
    player.score += 99 * player.multiplier;
    player.multiplier++;
  }
}

class Projectile extends Entity {
  
}

class Ship extends Entity {
  CollisionListener collisionListener;
  
  public void onCollision(CollisionEvent event) {
    sound2.play();
    
    if (collisionListener != null) {
      collisionListener.onCollision(event);
    }
  }
}

class PowerUp extends Entity {
  
}

class Emitter extends Entity {
  float period = 2;
  float cooldown = 0;
  
  float i = 0;
  
  public void update(float delta) {
    if ((cooldown -= delta) < 0) {
      cooldown = period;
      
      i++; 
      Ship s = new Ship();
      s.position.x = 200 + 20 * i;
      s.position.y = 50;
      CircleController c = new CircleController(s);
      c.center.set(s.position);
      s.controllers.add(c);
      game.pendingAdd.add(s);
      game.enemyShips.add(s);
    }
  }
}