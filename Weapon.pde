class Weapon {
  float period = 1;
  float cooldown = 0;
  
  public void roll(float delta) {
    cooldown -= delta;
  }
  
  public Projectile emit(Entity e, float delta) {
    if ((cooldown -= delta) < 0) {
      cooldown = period;
      
      
      
      Projectile projectile = new Projectile();
      projectile.position.set(e.position);
      projectile.velocity.y = (e.friendly) ? -100 : 100;
      projectile.alive = true;
      projectile.radius = 3;
      
      projectile.friendly = e.friendly;
      
      game.pendingAdd.add(projectile);
      
      if (projectile.friendly)
        game.friendlyProjectiles.add(projectile);
      else
        game.enemyProjectiles.add(projectile);
      
      if (projectile.friendly)
        sound.play();
      
      return projectile;
    }
    
    return null;
  }
}

class Trident extends Weapon {
  public Trident() {
    period = 0.5;
  }
  
  public Projectile emit(Entity e, float delta) {
    if ((cooldown -= delta) < 0) {
      cooldown = period;
      
      for (int i = -1; i <= 1; ++i) {
        Projectile projectile = new Projectile();
        projectile.position.set(e.position);
        projectile.velocity.set(e.velocity);
        projectile.velocity.mult(0.5f);
        projectile.velocity.y += (e.friendly) ? -200 : 200;
        projectile.velocity.x += i * 80;
        projectile.alive = true;
        projectile.radius = 3;
        
        projectile.friendly = e.friendly;
        
        game.pendingAdd.add(projectile);
        
        if (projectile.friendly)
          game.friendlyProjectiles.add(projectile);
        else
          game.enemyProjectiles.add(projectile);
        
      }
      
      if (e.friendly)
        sound.play();
      
      return null;
    }
    
    return null;
  }
}

class Rapid extends Weapon {
  int rushCount = 10;
  int maxRush = rushCount;
  int rechargePeriod = 1;
  
  Rapid(){
    period = .10;
  }
  
  public Projectile emit(Entity e, float delta) {
    if ((cooldown -= delta) < 0) {
      cooldown = period;
      rushCount --;
      
      if (cooldown < (-rechargePeriod + period)) {
        rushCount = maxRush;
      }
      
      if(rushCount > 0){
        Projectile projectile = new Projectile();
        projectile.position.set(e.position);
        projectile.velocity.y = (e.friendly) ? -100 : 100;
        projectile.velocity.x += random(-1, 1);
        projectile.alive = true;
        projectile.radius = 3;
        
        projectile.friendly = e.friendly;
        
        game.pendingAdd.add(projectile);
        
        if (projectile.friendly)
          game.friendlyProjectiles.add(projectile);
        else
          game.enemyProjectiles.add(projectile);
        
        if (projectile.friendly)
          sound.play();
        
        return projectile;
      }
      
      if(rushCount <= 0){
        rushCount = maxRush;
        cooldown = rechargePeriod;
      }
    }
    
    return null;
  }
}