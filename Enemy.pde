class Enemy extends GameObject
{
  void render()
  {
    shape = createShape(ELLIPSE, x, y, 50, 50);
    shape(shape);
  }
  
  void update()
  {
    if(frameCount % 120 == 0)
    {
      y += speed;
    }
    translate(x, y);
  }
}