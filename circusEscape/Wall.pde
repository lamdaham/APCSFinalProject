public class Wall {

  int x, y, w, h, leftSide, rightSide, topSide, bottomSide;

  public Wall(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.leftSide = x - (w/2);
    this.rightSide = x + (w/2);
    this.topSide = y - (w/2);
    this.bottomSide = y + (w/2);
    
    
  }
  
  
  void spawnWall() {
    fill(#C0C0C0);
    noStroke();
    rect(x,y,w,h);
  }
  
}
