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
          pendingRemove.add(ship);
          pendingRemove.add(projectile);
          
          s = ship;
          p = projectile;
          break friendly;
        }
      }
    }
    
    if (s != null)
      friendlyShips.remove(s);
    if (p != null)
      enemyProjectiles.remove(s);
    
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
          pendingRemove.add(ship);
          pendingRemove.add(projectile);
          
          s = ship;
          p = projectile;
          break enemy;
        }
      }
    }
    
    if (s != null)
      enemyShips.remove(s);
    if (p != null)
      friendlyProjectiles.remove(s);
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
    for (Entity entity : entities) {
      entity.draw();
    }
  }
  
  
}
