class Enemy2 extends Enemy
{
  
  Enemy2(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.speed = 5;
    this.size = 30;
    this.health = 4;
    
    create();
  }
  
  void create()
  {
    shape = createShape(RECT, 0, 0, size, size);
  }
  
  void render()
  {
    pushMatrix();
    update();
    shapeMode(CENTER);
    shape(shape);
    popMatrix();
  }
  
}