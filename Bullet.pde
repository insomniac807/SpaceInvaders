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
    pushMatrix();
    update();
    stroke(255, 0, 0);
    line(x, y, x, y-5);
    popMatrix();
  }
  
  void update()
  {
    y -= speed;
  }
  
}