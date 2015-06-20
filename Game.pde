class Game
{
  ArrayList<Entity> entities;
  
  
  ArrayList<Entity> pendingAdd = new ArrayList<Entity>();
  ArrayList<Entity> pendingRemove = new ArrayList<Entity>();
  
  ArrayList<Entity> friendlyShips = new ArrayList<Entity>();
  ArrayList<Entity> friendlyProjectiles = new ArrayList<Entity>();
  
  ArrayList<Entity> enemyShips = new ArrayList<Entity>();
  ArrayList<Entity> enemyProjectiles = new ArrayList<Entity>();
  
  public Game() {
    entities = new ArrayList<Entity>();
  }
  
  PVector temp = new PVector();
  CollisionEvent collision = new CollisionEvent();
  private Entity raiseCollision(Entity owner, Entity other) {
    collision.entity = other;
    collision.destroy = true;
    
    owner.onCollision(collision);
    
    if (collision.destroy) {
      return owner;
    }
    
    return null;
  }
  
  public void processCollisions() {
    Entity s = null;
    Entity p = null;
    
    friendly:
    for (Entity ship : friendlyShips) {
      for (Entity projectile : enemyProjectiles) {
        float r = ship.radius + projectile.radius;
        temp.set(ship.position);
        temp.sub(projectile.position);
        if (temp.magSq() < (r * r)) {
          // they collide
          
          s = raiseCollision(ship, projectile);
          p = raiseCollision(projectile, ship);
          break friendly;
        }
      }
    }
    
    if (s != null) {
      pendingRemove.add(s);
      friendlyShips.remove(s);
    }
    if (p != null) {
      pendingRemove.add(p);
      enemyProjectiles.remove(p);
    }
    
    s = null;
    p = null;
    
    enemy:
    for (Entity ship : enemyShips) {
      for (Entity projectile : friendlyProjectiles) {
        float r = ship.radius + projectile.radius;
        temp.set(ship.position);
        temp.sub(projectile.position);
        if (temp.magSq() < (r * r)) {
          // they collide
          
          s = raiseCollision(ship, projectile);
          p = raiseCollision(projectile, ship);
          break enemy;
        }
      }
    }
    
    if (s != null) {
      pendingRemove.add(s);
      enemyShips.remove(s);
    }
    if (p != null) {
      pendingRemove.add(p);
      friendlyProjectiles.remove(p);
    }
  }
  
  public void update() {
    processCollisions();
    
    for (Entity entity : entities) {
      entity.update(1/60f);
    }
    
    for (Entity entity : pendingAdd) {
      entities.add(entity);
    }
    pendingAdd.clear();
    
    for (Entity entity : pendingRemove) {
      entities.remove(entity);
    }
    pendingRemove.clear();
  }
  
  public void draw() {
    background(20);
    
    for (Entity entity : entities) {
      entity.draw();
    }
    
    drawUi();
  }
  
  
  PFont font = createFont("Eurostile", 16);
  public void drawUi() {
    fill(0);
    noStroke();
    
    rect(0, 0, 150, 800);
    
    rect(650, 0, 150, 800);
    
    fill(255);
    textFont(font);
    textAlign(LEFT, TOP);
    text("Lives", 10, 10);
    text("3", 10, 30);
    
    
    textAlign(RIGHT, TOP);
    text("Score", width - 10, 10);
    text("393993", width - 10, 30);
  }
  
}

