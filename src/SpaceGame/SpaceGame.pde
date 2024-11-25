// Sadayo Mabey | SpaceGame | 6 Nov. 2024
import processing.sound.*;
SoundFile laser1;
int score, level, health, rockTime;
boolean play;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rTime, puTime;

void setup() {
  size(500, 500);
  laser1 = new SoundFile(this, "laser.wav");
  s1 = new Spaceship();
  rockTime = 1000;
  rTime = new Timer(rockTime);
  rTime.start();
  puTime = new Timer(8000);
  puTime.start();
  health = 100;
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    if (frameCount % 1000 == 0) {
      level = level + 1;
      rockTime-=50;
    }

    background(0);
    stars.add(new Star());
    for (int i = 0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    if (play) {
      noCursor();
    }

    if (keyPressed && key == ' ') {
      lasers.add(new Laser(s1.x, s1.y));
    }
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          //
          score+=r.diam;
          lasers.remove(laser);
          rocks.remove(r);
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.health -= rock.diam;
        rocks.remove(rock);
        // score += rock.diam;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }

    // power up logic
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        // s1.health -= pu.diam;
        // decide what the user receives
        // 1. possible health bennefit
        if (pu.type == 'h') {
          s1.health += 50;
        } else if (pu.type == 'b') {
          s1.laserCount += 100;
        }
        // s1.health += 100;
        powups.remove(pu);
        // 2. replenish ammo
        // 3. invicible mode
        // 4. increase turret count
        // 5. visual change to the ship
        // 6. wave to take out all rocks and enemies
        // 7. slow rocks
        // 8. point bonus
      }
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }


    infoPanel();
    s1.display();
    s1.move(mouseX, mouseY);
    if (s1.health < 1) {
      gameOver();
      noLoop();
    }
  }
}
void keyPressed() {
  if (s1.fire()) {
    laser1.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  }
}

void mousePressed() {
  if (s1.fire()) {
    laser1.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  stroke(200);
  rect(width/2, 20, width, 40);
  fill(200);
  textSize(25);
  text("Score:" + score, 20, 35);
  text("HP:" + s1.health, 140, 35);
  text("LVL:" + level, 270, 35);
  text("Ammo:" + s1.laserCount, 380, 35);
}

void startScreen() {
  background(0);
  fill(255);
  text("Welcome to SpaceGame", width/2, 300);
  text("click to start...", width/2, 350);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("GAME OVER", width/2, 300);
  text("Score:" + score, width/2, 350);
  text("LVL:" + level, width/2, 400);
}

void ticker() {
}
