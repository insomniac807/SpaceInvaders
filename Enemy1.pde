class Enemy1 extends Enemy
{
  
  Enemy1(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.speed = 5;
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
      shape.vertex(0, 0);
      shape.vertex(-20, -30);
      shape.vertex(20, -30);
    shape.endShape(CLOSE);
  }
  
  
  void render()
  {
    pushMatrix();
    update();
    shape(shape);
    popMatrix();
  }
  
}