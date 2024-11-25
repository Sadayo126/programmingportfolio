class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
  PImage p1;

  // Constructor
  Powerup() {
    x = int(random(width));
    y = -200;
    diam = int(random(30, 85));
    speed = int(random(1, 5));
    int rand = int(random(2));
    if (rand == 0) {
      p1 =  loadImage("healthpxl.png");
      type = 'h';
    } else if(rand == 1) {
      p1 =  loadImage("bulletpxl.png");
      type = 'b';
    }
  }

  void display() {
    p1.resize(diam,diam);
    image(p1, x, y);
  }

  void move() {
    y = y + speed;
  }


  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
