class Entity
{
  PVector position = new PVector(); 
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  PVector temp = new PVector();
  
  boolean alive = false;
  float radius = 10;
  
  public Entity() {
    
  }
  
  public void draw() {
    ellipseMode(CENTER);
    fill(100);
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
    
  }
  
}
