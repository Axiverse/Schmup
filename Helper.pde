class FrameEvent {
  PGraphics g;
  float delta;
}

class CollisionEvent {
  Entity entity;
  boolean destroy;

  public void preventDefault() {
    destroy = false;
  }
}

interface CollisionListener {
  public void onCollision(CollisionEvent event);
}