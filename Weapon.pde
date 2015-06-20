class Weapon {
  float period = 1;
  float cooldown = 0;
  
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
      return projectile;
    }
    
    return null;
  }
}
