class Rectangle {
  
  int x;
  int y;
  int w;
  int h;
  
  Rectangle(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  boolean contains(PVector location) {
    if ( (location.x >= this.x - this.w) && (location.x <= this.x + this.w) && (location.y <= this.y + this.h) && (location.y >= this.y - this.h) ) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersects(Circle area) {
    float testX;
    float testY;
    float distX;
    float distY;
    float distance_sq;
    
    if (area.x < this.x - this.w) testX = this.x - this.w;
    else if (area.x > this.x + this.w) testX = this.x + this.w;
    else testX = area.x;
    
    if (area.y < this.y - this.h) testY = this.y - this.h;
    else if (area.y > this.y + this.h) testY = this.y + this.h;
    else testY = area.y;
    
    distX = area.x - testX;
    distY = area.y - testY;
    distance_sq = (distX*distX)+(distY*distY);
    if (distance_sq <= area.r*area.r) return true;
    else return false;
  }
  
  void show() {
    stroke(255,10);
    strokeWeight(1);
    //fill(100,40);
    noFill();
    rectMode(RADIUS);
    rect(this.x, this.y, this.w, this.h);
  }

  void show(int rfill, int gfill, int bfill) {
    stroke(255);
    strokeWeight(2);
    fill(rfill, gfill, bfill, 40);
    rectMode(RADIUS);
    rect(this.x, this.y, this.w, this.h);
  }
}
