ArrayList<Particle> particles= new ArrayList<Particle>();
PVector emit;

void setup() {
  size(400, 800);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  emit = new PVector(width/2, height/7);
}

void draw() {
  background(0);
  particles.add(new Particle(emit));
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    p.update();
    if (p.loc.y > height) {
      particles.remove(i);
    }
  }
}


class Particle {
  PVector loc, vel, acc;
  float d;
  float hue;
  float sat;
  float bright;
  float alpha;

  Particle(PVector emit) {
    loc = emit.get();
    vel = new PVector(random(-.5, .5), random(-2, -.5));
    acc = new PVector(0, .01);
    d = 15;
    hue = 270;
    sat = 60;
    bright = 100;
    alpha = 50;
  }

  void display() {
    fill(hue, sat, bright, alpha);
    ellipse(loc.x, loc.y, d, d);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
  }
}

