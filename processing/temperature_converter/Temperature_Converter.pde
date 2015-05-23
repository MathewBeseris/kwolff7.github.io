void setup() {
  size(500, 800);
  background(255);
}

void draw() {
  background(255);
  tempFill();
  thermometer();
  strokeWeight(5);
  fill(250, 0, 0);
  ellipse(width/2, 650, 200, 200);
  fill(0);
  textSize(10);
  text("Farenheit Value = " + int(height/4-mouseY+300), 20, 200);
  text("Celcius Value = " + farConvert(height/4-mouseY+300), 350, 200);
}

void tempFill() {
  strokeWeight(5);
  fill(255, 0, 0);
  if (mouseY >= 50 && mouseY < 600) {
    rect(176, 600, 148, mouseY-600);
  } else if (mouseY < 50) {
    rect(176, 50, 148, 600);
  }
}

void thermometer() {
  noFill();
  rect(175, 50, 150, 600, 5);
  strokeWeight(2);
  for (int i=50; i<600; i+=75) {
    line(177, i, 325, i);
    fill(0);
    text(-i+500, 150, i+5);
  }
}

float farConvert (float value) {
  value = (value-32) * (5.0/9.0);
  return value;
}


