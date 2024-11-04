class Button {
  // Member Variables
  int w, h, x, y;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, int w, int h, color c1, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    c1 = color(155);
    c2 = color(191, 192, 231);
    this.val = val;
    on=false;
    this.isNum = isNum;
  }

  // Member Methods
  void display() {
    fill(c1);
    rectMode(CENTER);
    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    text(val, x, y);
    if (on) {
      fill(c2);
      rectMode(CENTER);
      rect(x, y, w, h, 5);
      fill(0);
      textAlign(CENTER, CENTER);
      text(val, x, y);
    }
  }
  void hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
    } else {
      on = false;
    }
  }
}
