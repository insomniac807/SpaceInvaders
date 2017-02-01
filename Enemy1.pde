class Enemy1 extends Enemy
{
  
  Enemy1(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.speed = 5;
    this.size = 50;
    this.health = 2;
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
      shape.vertex(0, 0);
      shape.vertex(-size/2, -size/2);
      shape.vertex(size/2, -size/2);
    shape.endShape(CLOSE);
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