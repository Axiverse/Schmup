class Game
{
  ArrayList<Entity> entities;
  
  
  ArrayList<Entity> pendingAdd = new ArrayList<Entity>();
  ArrayList<Entity> pendingRemove = new ArrayList<Entity>();
  
  public Game() {
    entities = new ArrayList<Entity>();
  }
  
  
  public void update() {
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
