class VehicleList {
  ArrayList<Vehicle> vehicles;
  int size;

  VehicleList(int size) {
    this.size = size;
    this.vehicles = new ArrayList<Vehicle>();
    for (int i = 0; i < this.size; i++) {
      this.generate();
    }
  }

  void insert(Vehicle car) {
    this.vehicles.add(car);
  }

  void update() {
    
    QTree tree = new QTree();
    
    for (Vehicle car: this.vehicles) {
      tree.insert(car);
    }
    for (Vehicle car: this.vehicles) {
      car.go_to(mouseX,mouseY);
      Circle area = new Circle(car.position, 26);
      ArrayList<Vehicle> proximity = new ArrayList<Vehicle>();
      proximity = tree.query(area, proximity);
      
      car.separate(proximity);
      car.update();
      car.show();
    } 
    tree.show();
   }

  void generate() {
    Vehicle obj;
    obj = new Vehicle(random(width),random(height));
    
    float i = random(0,100);
    if (i < 2) obj.special = true;
    else if (i < 15 && i > 2) obj.bad = true;
    else obj.bad = false;
    
    vehicles.add(obj);
  }
}
