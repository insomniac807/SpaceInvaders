class Player
{
  float x, y, speed;
  PShape shape;
  
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    speed = 2;
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
      shape.vertex(x, y);
      shape.vertex(x-20, y+30);
      shape.vertex(x+20, y+30);
    shape.endShape(CLOSE);
  }
  
  
  void render()
  {
    create();
    shape(shape);
  }
  
  
  void update()
  {
    if(checkKey(LEFT))
    {
      x -= speed;
    }
    
    if(checkKey(RIGHT))
    {
      x += speed;
    }
    
    if(checkKey(UP))
    {
    }
    
    if(checkKey(DOWN))
    {
    }
    render();
  }
}