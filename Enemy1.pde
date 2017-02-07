class Enemy1 extends Enemy
{
  
  Enemy1(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.health = 2;
    this.alive = true;
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
      shape.vertex(0, 0);
      shape.vertex(-size, -size);
      shape.vertex(size, -size);
    shape.endShape(CLOSE);
  }
  
  
  void render()
  {
    pushMatrix();
    update();
    shapeMode(CENTER);
    if( health > 0 )
    {
      shape(shape);
    }
    else if( health == 0 )
    {
      this.alive = false;
      score += 1;
      health -= 1;
      enemiesLeft--;
    }
    popMatrix();
  }
  
  void resetHealth()
  {
    this.health = 2;
  }
  
}