class Laser {
  // Member Variables
  int x, y, w, h, speed;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 20;
    speed = 5;
  }

  void display() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<20) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }
}
