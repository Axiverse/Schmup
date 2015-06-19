class Entity
{
  PVector position = new PVector(); 
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  PVector temp = new PVector();
  
  boolean alive = false;
  boolean friendly = false;
  float radius = 10;
  
  ArrayList<Controller> controllers = new ArrayList<Controller>();
  Weapon weapon = new Weapon();
  
  public Entity() {
    
  }
  
  public void draw() {
    ellipseMode(CENTER);
    
    if (friendly)
      fill(0, 0, 255);
    else
      fill(255, 0, 0);
    
    ellipse(position.x, position.y, radius, radius);
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
    
  }
  
}

class Projectile extends Entity {
  
}

class Ship extends Entity {
  
}

class PowerUp extends Entity {
  
}
