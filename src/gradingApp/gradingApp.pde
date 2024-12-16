// Sadayo Mabey | Grading App | 13 Sept. 2024 //<>//
float grade;
void setup () {
  size(750,150);
  background(200);
}

void draw() {
  background(100);
  textSize(30);
  textAlign(CENTER);
  fill(255);
  text("Grades by Sadayo Mabey",width/2,50);
  line(0,100,width,100);
  for(int i=0; i<width; i+=50) {
    line(i,95,i,105);
    textSize(10);
    text(i*0.2,i,112);
  }
  // line(50,95,50,105);
  // textSize(12);
  // text("50",50,90);
  ellipse(mouseX,100,5,5);
  textSize(16);
  text(mouseX,mouseX,120);
  grade = random(0, 4.0001);
  println(grade);
  if (grade >= 3.51) {
    println("Assign letter grade A.");
  } else if (grade >= 3.00) {
    println ("Assign letter grade A-");
  } else if (grade >= 2.84) {
    println ("Assign letter grade B+");
  } else if (grade >= 2.67) {
    println ("Assign letter grade B.");
  } else if (grade >= 2.50) {
    println ("Assign letter grade B-.");
  } else if (grade >= 2.34) {
    println ("Assign letter grade C+.");
  } else if (grade >= 2.17) {
    println ("Assign letter grade C.");
  } else if (grade >= 2.00) {
    println ("Assign letter grade C-.");
  } else if (grade >= 1.66) {
    println ("Assign letter grade D+.");
  } else if (grade >= 1.33) {
    println ("Assign letter grade D.");
  } else if (grade >= 1.00) {
    println ("Assign letter grade D-.");
  } else {
    println ("Assign letter grade F.");
  }
}
