class Enemy2 extends Enemy
{
  
  Enemy2(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.health = 4;
    this.alive = true;
    
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
    shapeMode(CORNER);
    if( health > 0)
    {
      shape(shape);
    }
    else if( health == 0 )
    {
      alive = false;
      score += 3;
      health -= 1;
      enemiesLeft--;
    }
    popMatrix();
  }
  
  void resetHealth()
  {
    this.health = 4;
  }
  
}