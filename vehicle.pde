class Vehicle {
  
  PVector position;
  PVector speed;
  PVector accel;
  int maxspeed;
  float maxforce;
  boolean remove;
  boolean bad;
  boolean special;
  
  Vehicle(float x, float y) {
    position = new PVector(x,y);
    speed = new PVector(0,0);
    accel = new PVector(0,0);
    maxspeed = 4;
    maxforce = 0.1;
  }
  
  void update() {
    speed.add(accel);
    speed.limit(maxspeed);
    position.add(speed);
    accel.mult(0);
  }
  
  void go_to(float x, float y) {
    
    PVector goal;
    PVector desired;
    PVector steer;
    
    float distance;
    float m;
    
    goal = new PVector(x, y);
    
    desired = PVector.sub(goal,position);
    distance = desired.mag();
    desired.normalize();
    
    if (distance < 100) {
      m = map(distance,0,100,0,maxspeed);
      desired.setMag(m);
    } else {
      desired.setMag(maxspeed);
    }
    
    if (distance < 18) {
      remove = true;
    }
    
    steer = PVector.sub(desired,speed);
    steer.limit(maxforce);
    accel.add(steer);
  }
  
   void separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = 40;
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);  
        sum.add(diff);
        count++;

      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, speed);
      steer.limit(maxforce);
      steer.mult(2);
      accel.add(steer);
    }

  }
  
  void show(int r, int g, int b) {
    strokeWeight(6);
    stroke(r,g,b);
    point(position.x, position.y);
  }
  
  void show() {
    int r,g,b;
    if (bad) {
      r = 255;
      g = 0;
      b = 0;
    } else if (special) {
      r = 200;
      g = 200;
      b = 0;
    } else {
      r = 0;
      g = 200;
      b = 100;
    }
    strokeWeight(6);
    stroke(r,g,b);
    point(position.x, position.y);
  }
}
