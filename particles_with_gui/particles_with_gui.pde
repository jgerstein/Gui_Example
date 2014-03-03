import controlP5.*;

ControlP5 cp5;
int hue = 270;
int sat = 60;
int bright = 100;
int alpha = 30;
int rate = 2;
ArrayList<Particle> particles= new ArrayList<Particle>();
PVector emit;
Slider abc;

void setup() {
  size(400, 800);
  colorMode(HSB, 360, 100, 100, 100);
  cp5 = new ControlP5(this);
  cp5.addSlider("rate")
    .setPosition(20, 20)
      .setRange(1, 5)
        .setNumberOfTickMarks(5)
          ;
  cp5.addSlider("hue")
    .setPosition(20, 40)
      .setRange(0, 360)
        ;
  cp5.addSlider("sat")
    .setPosition(20, 60)
      .setRange(0, 100)
        ;
  cp5.addSlider("bright")
    .setPosition(20, 80)
      .setRange(0, 100)
        ;
  cp5.addSlider("alpha")
    .setPosition(20, 100)
      .setRange(0, 100)
        ;
  noStroke();
  emit = new PVector(width/2, height/7);
}

void draw() {
  background(50);
  println(particles.size());
  for (int i = 0; i < rate; i++) {
    particles.add(new Particle(emit, hue, sat, bright, alpha));
  }
  for (Particle p : particles) {
    p.display();
    p.update();
  }
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);

    if (p.loc.y > height) {
      particles.remove(i);
    }
  }
}


class Particle {
  PVector loc, vel, acc;
  float d;
  float h;
  float s;
  float b;
  float a;

  Particle(PVector emit, float hue, float sat, float bright, float alpha) {
    loc = emit.get();
    vel = new PVector(random(-.5, .5), random(-2, -.5));
    acc = new PVector(0, .01);
    d = 15;
    h = hue;
    s = sat;
    b = bright;
    a = alpha;
  }

  void display() {
    fill(h, s, b, alpha);
    ellipse(loc.x, loc.y, d, d);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
  }
}

