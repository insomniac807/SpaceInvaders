class Player extends GameObject
{
  int ammo;
  
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    ammo = 200;
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
  
  void fire()
  {
    if(frameCount % 5 == 0)
    {
      amunition.add(new Bullet(this.x, this.y));
    }
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
      this.x -= speed;
    }
    
    if(checkKey(RIGHT))
    {
      this.x 
  += speed;
    }
    
    if(checkKey(UP))
    {
      fire();
    }
    
    if(checkKey(DOWN))
    {
    }
    render();
  }
}