import controlP5.*;

ControlP5 cp5;

Range range;

float minSize = 3;
float maxSize = 20;
float minHue = 150;
float maxHue = 250;
void setup() {
  size(600, 400);
  colorMode(HSB, 360, 100, 100, 100);
  cp5 = new ControlP5(this);
  range = cp5.addRange("size range")
    .setBroadcast(false)
      .setPosition(50, 10)
        .setSize(500, 20)
          .setHandleSize(15)
            .setRange(1, 50)
              .setRangeValues(minSize, maxSize)
                .setBroadcast(true)
                  .setColorForeground(color(360, 100))
                    .setColorBackground(color(360, 10))
                      ;
  range = cp5.addRange("hue")
    .setBroadcast(false)
      .setPosition(50, height-30)
        .setSize(500, 20)
          .setHandleSize(15)
            .setRange(0, 360)
              .setRangeValues(minHue, maxHue)
                .setBroadcast(true)
                  .setColorForeground(color(360, 100))
                    .setColorBackground(color(360, 10))
                      ;
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);

  for (int i = 0; i < 30; i++) {
    float d = random(minSize, maxSize);
    float h = random(minHue, maxHue);
    fill(h, 80, 100);
    ellipse(random(width), random(height), d, d);
  }
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("size range")) {
    minSize = theControlEvent.getController().getArrayValue(0);
    maxSize = theControlEvent.getController().getArrayValue(1);
  }
  if (theControlEvent.isFrom("hue")) {
    minHue = theControlEvent.getController().getArrayValue(0);
    maxHue = theControlEvent.getController().getArrayValue(1);
  }
}

