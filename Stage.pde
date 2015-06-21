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

class Title extends Ornament {
  String text = "Chapter 1: Exploration";
  PFont font = createFont("Eurostile", 36);
  
  public Title() {
    position.set(400, 200, 50);
  }
  
  public void draw() {
    noStroke();
    fill(255);
    textFont(font);
    textAlign(CENTER, CENTER);
    text(text, 0, 0);
  }
}

class Planet extends Ornament {
  public Planet() {
    position.set(200, 400, 10);
  }
  
  public void draw() {
    //stroke(#33CBF5);
    fill(#23A7CC);
    ellipse(0, 0, 510, 510);
    
    noStroke();
    fill(0);
    ellipse(0, 0, 500, 500);
  }
}

class Moon extends Ornament {
  public Moon() {
    position.set(350, 0, 15);
  }
  
  public void draw() {
    noStroke();
    fill(100);
    ellipse(0, 0, 150, 150);
  }
}

class Starfield extends Ornament {
  ArrayList<PVector> stars = new ArrayList<PVector>();
  
  public Starfield() {
    position.z = 1;
    
    for (int i = 0; i < 200; ++i) {
      stars.add(new PVector(random(150, 650), random(-800, 800), 0));
    }
  }
  
  public void draw() {
    fill(200);
    for(PVector star : stars) {
      ellipse(star.x, star.y, 2, 2);
    }
  }
}