void setup() {
  size(400,400);
  background(255);
  frameRate(1);
}

void draw() {
  background(255);
  strokeWeight(5);
  fill(random(240,255),random(240,255),0);  
  ellipse(width/2,height/2,random(300,350),random(300,350));
  fill(255);
  ellipse(random(130,150),random(130,150),random(5,30),random(5,30));
  ellipse(random(230,250),random(130,150),random(20,30),random(20,30));
  line(175,150,250,225);
  line(250,225,175,225);
  line(random(80,140),random(225,320),random(280,300),random(225,320));
}



