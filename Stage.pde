class Stage {
  ArrayList<Ornament> ornaments = new ArrayList<Ornament>();
  float elapsed;
  
  public void draw() {
    for (Ornament ornament : ornaments) {
      pushMatrix();
      translate(ornament.position.x, ornament.position.y + ornament.position.z * elapsed);
      
      ornament.draw();
      
      popMatrix();
    }
  }
  
  public void update(float delta) {
    elapsed += delta;
  }
}

class Ornament {
  PVector position = new PVector();
  
  public void draw() {
    
  }
}

class Planet extends Ornament {
  public Planet() {
    position.set(200, 400, 10);
  }
  
  public void draw() {
    fill(0);
    ellipse(0, 0, 500, 500);
  }
}

class Starfield extends Ornament {
  ArrayList<PVector> stars = new ArrayList<PVector>();
  
  public Starfield() {
    position.z = 1;
    
    for (int i = 0; i < 100; ++i) {
      stars.add(new PVector(random(150, 650), random(0, 800), 0));
    }
  }
  
  public void draw() {
    fill(200);
    for(PVector star : stars) {
      ellipse(star.x, star.y, 2, 2);
    }
  }
}