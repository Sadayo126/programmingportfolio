// Sadayo Mabey | Timeline Project | Aug. 28, 2024

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(100, 200, "Z2 - 1940", "Germany; earliest example of an electric operated digital computer",true);
  histEvent(180, 300, "Z3 - 1941", "Germany; world's first working electromechanical programmable",false);
  histEvent(280, 200, "IBM SSEC - 1948", "America; the first operational machine able to treat its instructions as data, but it was not fully electronic",true);
  histEvent(380, 300, "4", "4",false);
  histEvent(480, 200, "5", "5",true);
  histEvent(580, 300, "6", "6",false);
  histEvent(680, 200, "7", "7",true);
  histEvent(760, 300, "8", "8",false);
}

void drawRef() {
  // timeline format
  strokeWeight(4);
  stroke(50);
  line(100, 250, 800, 250);
  textSize(18);
  text("1940", 80, 268);
  text("1960", 820, 268);


  // title text
  textSize(35);
  textAlign(CENTER);
  textSize(30);
  text("Historic Computer Systems", width/2, 60);
  textSize(20);
  text("Sadayo Mabey", width/2, 90);
}

void histEvent(int x, int y, String val, String detail, boolean top) {
  if (top) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  fill(200);
  rectMode(CENTER);
  rect(x, y, 80, 20);
  fill(0);
  textSize(15);
  text(val, x, y+6);

  if (mouseX>x-40 && mouseX<x+40 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
// timeline
