class Spaceship {
  // Member Variables
  int x, y, w, health, laserCount, turretCount;

  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    laserCount = 100;
    turretCount = 1;
  }

  void display() {
    stroke(50);
    fill(175);
    triangle(x, y - 43, x+18, y + 8, x-18, y+8);

    fill(100);
    triangle(x-6.5, y - 23, x-1, y + 8, x-28, y+18);
    triangle(x+6.5, y - 23, x+1, y + 8, x+28, y+18);

    fill(192, 224, 255);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
