// Sadayo Mabey | Calc Project | 2 Oct 2024
Button[] buttons = new Button[23];
String dVal = "0";
char op;
float l, r, result;
boolean left;

void setup() {
  size(170, 300);
  background(0, 0, 63);
  left = true;
  op = ' ';
  l = 0;
  r = 0;
  result = 0;
  buttons[0] = new Button(25, 70, 37, 37, color(192, 224, 255), "%", false);
  buttons[1] = new Button(65, 70, 37, 37, color(192, 224, 255), "del", false);
  buttons[2] = new Button(125, 70, 77, 37, color(192, 224, 255), "C", false);
  buttons[3] = new Button(25, 110, 37, 37, color(224, 240, 255), "π", false);
  buttons[4] = new Button(65, 110, 37, 37, color(224, 240, 255), "√", false);
  buttons[5] = new Button(105, 110, 37, 37, color(224, 240, 255), "^", false);
  buttons[6] = new Button(145, 110, 37, 37, color(224, 240, 255), "÷", false);
  buttons[7] = new Button(25, 150, 37, 37, color(255), "1", true);
  buttons[8] = new Button(65, 150, 37, 37, color(255), "2", true);
  buttons[9] = new Button(105, 150, 37, 37, color(255), "3", true);
  buttons[10] = new Button(145, 150, 37, 37, color(255), "×", false);
  buttons[11] = new Button(25, 190, 37, 37, color(240, 252, 239), "4", true);
  buttons[12] = new Button(65, 190, 37, 37, color(240, 252, 239), "5", true);
  buttons[13] = new Button(105, 190, 37, 37, color(240, 252, 239), "6", true);
  buttons[14] = new Button(145, 190, 37, 37, color(240, 252, 239), "-", false);
  buttons[15] = new Button(25, 230, 37, 37, color(224, 249, 227), "7", true);
  buttons[16] = new Button(65, 230, 37, 37, color(224, 249, 227), "8", true);
  buttons[17] = new Button(105, 230, 37, 37, color(224, 249, 227), "9", true);
  buttons[18] = new Button(145, 230, 37, 37, color(224, 249, 227), "+", false);
  buttons[19] = new Button(25, 270, 37, 37, color(191, 248, 207), ".", false);
  buttons[20] = new Button(65, 270, 37, 37, color(191, 248, 207), "0", true);
  buttons[21] = new Button(105, 270, 37, 37, color(191, 248, 207), "±", false);
  buttons[22] = new Button(145, 270, 37, 37, color(191, 248, 207), "=", false);
}

void draw() {
  background(0, 0, 63);
  println("Left:" + l + " Op:" + op + " Right:" + r + " Result:" + result);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(159, 192, 255);
  rect(width/2, 25, 160, 40);
  fill(0);
  if (dVal.length()<10) {
    textSize(30);
  } else if (dVal.length() <9) {
    textSize(25);
  }
  textAlign(RIGHT);
  textSize(30);
  text(dVal, width-20, 35);
  textSize(23);
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left == true) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && left == false) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      dVal = "0";
      op = '+';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      dVal = "0";
      op = '-';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("×")) {
      dVal = "0";
      op = '×';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      dVal = "0";
      op = '÷';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        dVal = str(PI);
        l = PI;
      } else {
        dVal = str(PI);
        r = PI;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("C")) {
      left = true;
      op = ' ';
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      performCalc();
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l = l * 0.01;
        dVal = str(l);
      } else {
        r = r * 0.01;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("del")) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("^")) {
      dVal = "0";
      op = '^';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    }



    //if (buttons[i].on == true) {
    //  if (buttons[i].val.equals("C")) {
    //    dVal = "0";
    //    op = ' ';
    //    l = 0;
    //    r = 0;
    //    result = 0;
    //  } else if (dVal.equals("0")) {
    //    dVal = buttons[i].val;
    //  } else {
    //    if (left == true) {
    //      dVal += buttons[i].val;
    //      l = float(dVal);
    //    }
    //  }
    //}
  }
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '×') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  dVal = str(result);
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  }
}


void keyPressed() {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2) {
    handleEvent("2", true);
  } else if (key == 3) {
    handleEvent("3", true);
  } else if (key == 4) {
    handleEvent("4", true);
  } else if (key == 5) {
    handleEvent("5", true);
  } else if (key == 6) {
    handleEvent("6", true);
  } else if (key == 7) {
    handleEvent("7", true);
  } else if (key == 8) {
    handleEvent("8", true);
  } else if (key == 9) {
    handleEvent("9", true);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", true);
  } else if (key == '.' || keyCode == 110) {
    handleEvent(".", true);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", true);
  }
}
