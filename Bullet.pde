class Bullet extends GameObject
{
  
  Bullet(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.speed = 15;
  }
  
  void render()
  {
    stroke(255, 0, 0);
    line(x, y, x, y-5);
  }
  
  void update()
  {
    pushMatrix();
    y -= speed;
    render();
    popMatrix();
  }
  
}