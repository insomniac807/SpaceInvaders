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
    ellipse(x, y, 2, 2);
    popMatrix();
  }
  
  void update()
  {
    y -= speed;
  }
  
  String toString()
  {
    return "Bullet";
  }
  
}