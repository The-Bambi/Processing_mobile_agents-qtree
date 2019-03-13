VehicleList vehicles;
QTree tree;
Circle area;

void setup() {
  noCursor();
  textSize(30);
  size(600,600);
  vehicles = new VehicleList(1000);
}

void draw() {
  
  background(51);
  fill(200,200,200,90);
  strokeWeight(1);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,25,25);
  
  fill(255);
  stroke(0);
  
  vehicles.update();
}
