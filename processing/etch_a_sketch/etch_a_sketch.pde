//global variable
int x, y;

void setup() {
  size(500, 500);
  frameRate(20);
  background(255);
  strokeWeight(5);
  smooth();
  //Set start coords
  x = width/2;
  y = height/2;
}

void draw() {
  //Algorithm for your first name
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      left(1);
    }
    if (key == 's' || key == 'S') {
      down(1);
    }
    if (key == 'd' || key == 'D') {
      right(1);
    } 
    if (key == 'w' || key == 'W') {
      up(1);
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
        right(1);
      }
      if (keyCode == LEFT) {
        left(1);
      }
      if (keyCode == UP) {
        up(1);
      }
      if (keyCode == DOWN) {
        down(1);
      }
    }
    if (x==width) {
      x=0;
    } else if (x==0) {
      x=width;
    } else if (y==height) {
      y=0;
    } else if (y==0) {
      y=height;
    }  
  }
}

// Method to draw right line
void right (int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y);
  }
  x=x+(10*rep);
}

//Method to draw left line
void left (int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y);
  }
  x=x-(10*rep);
}

//Method to draw up line
void up (int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y-i);
  }
  y=y-(10*rep);
}

//Method to draw down line
void down(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y+i);
  }
  y=y+(10*rep);
}

//Method to draw diagnol left down line
void leftDown (int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y+i);
  }
  x=x-(10*rep);
  y=y+(10*rep);
}

//Method to draw diagnol left up line
void leftUp (int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y-i);
  }
  x=x-(10*rep);
  y=y-(10*rep);
}

//Method to draw diagnol right down line
void rightDown (int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y+i);
  }
  x=x+(10*rep);
  y=y+(10*rep);
}

//Method to draw diagnol right up line
void rightUp (int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y-i);
  }
  x=x+(10*rep);
  y=y-(10*rep);
}


