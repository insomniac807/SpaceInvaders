class Bullet extends GameObject
{
  
  Bullet(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void render()
  {
    line(x, y, x, y-10);
  }
  
  void update()
  {
    render();
  }
  
}