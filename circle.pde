class Circle {
  float x,y,r;

  Circle(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  Circle(PVector location, int r) {
    this.x = location.x;
    this.y = location.y;
    this.r = r;
  }

  boolean contains(PVector location) {
    float distX, distY, dist_sq, r_sq;
    distX = Math.abs(location.x - this.x);
    distY = Math.abs(location.y - this.y);
    dist_sq = (distX*distX + distY*distY);
    r_sq  = this.r * this.r;
    if (dist_sq < r_sq && dist_sq < r_sq) return true; 
    else return false;
    }

  void show() {
    stroke(255);
    strokeWeight(2);
    fill(100,40);
    ellipseMode(RADIUS);
    ellipse(this.x, this.y, this.r, this.r);
  }

  void show(int rfill, int gfill, int bfill) {
    stroke(255);
    strokeWeight(2);
    fill(rfill, gfill, bfill, 40);
    ellipseMode(RADIUS);
    ellipse(this.x, this.y, this.r, this.r);
  }

}
