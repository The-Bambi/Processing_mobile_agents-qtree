class QTree { 
  
  Rectangle dimentions;
  QTree nw;
  QTree ne;
  QTree sw;
  QTree se;
  
  Vehicle storage;
  boolean divided = false;

  int capacity = 0;
  
  QTree(Rectangle dimentions) {
    this.dimentions = dimentions;
  }

  QTree() {
    this.dimentions = new Rectangle(width/2, height/2, width/2, height/2);
  }

  QTree(int x, int y, int w, int h) {
      this.dimentions = new Rectangle(x, y, w, h);
  }

  void insert(Vehicle data) { //vehicle
    if (!(this.dimentions.contains(data.position))) { //location
      return;
    } 
    if (this.storage == null) {
      this.storage = data;
      this.capacity++;
      return;
    }
    if (!(this.divided)) {
      this.divide();
    }
    this.nw.insert(data);
    this.ne.insert(data);
    this.sw.insert(data);
    this.se.insert(data);
  }

  ArrayList<Vehicle> query(Circle area, ArrayList<Vehicle> found) {
    if(this.dimentions.intersects(area)) {
      if ((this.storage != null) && area.contains(this.storage.position)) {
        found.add(this.storage);
      }
      if (this.divided) {
        this.ne.query(area, found);
        this.nw.query(area, found);
        this.se.query(area, found);
        this.sw.query(area, found);
      }
    }
    return found;
  }  

  void divide() {
    Rectangle rnw, rne, rsw, rse;
    
    this.divided = true;
    
    rnw = new Rectangle(this.dimentions.x - this.dimentions.w/2, this.dimentions.y - this.dimentions.h/2, this.dimentions.w/2, this.dimentions.h/2);
    this.nw = new QTree(rnw);
    
    rne = new Rectangle(this.dimentions.x + this.dimentions.w/2, this.dimentions.y - this.dimentions.h/2, this.dimentions.w/2, this.dimentions.h/2);
    this.ne = new QTree(rne);
    
    rsw = new Rectangle(this.dimentions.x - this.dimentions.w/2, this.dimentions.y + this.dimentions.h/2, this.dimentions.w/2, this.dimentions.h/2);
    this.sw = new QTree(rsw);
    
    rse = new Rectangle(this.dimentions.x + this.dimentions.w/2, this.dimentions.y + this.dimentions.h/2, this.dimentions.w/2, this.dimentions.h/2);
    this.se = new QTree(rse);
  }

  void show() {
    this.dimentions.show();
    if (this.divided) {
      this.ne.show();
      this.nw.show();
      this.se.show();
      this.sw.show();
    }
  }
}
