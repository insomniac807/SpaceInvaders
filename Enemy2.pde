class Enemy2 extends Enemy
{
  
  Enemy2(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.speed = 5;
    
    create();
  }
  
  void create()
  {
    shape = createShape(RECT, 0, 0, 30, 30);
  }
  
  void render()
  {
    pushMatrix();
    update();
    shape(shape);
    popMatrix();
  }
  
}