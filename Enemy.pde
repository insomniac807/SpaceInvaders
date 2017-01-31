class Enemy
{
  float x, y, speed;
  PShape shape;
  
  Enemy(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
      shape.vertex(x, y);
      shape.vertex(x-20, y-30);
      shape.vertex(x+20, y-30);
    shape.endShape(CLOSE);
  }
  
  
  void render()
  {
    shape(shape);
  }
  
  
  void update()
  {
    render();
  }
}