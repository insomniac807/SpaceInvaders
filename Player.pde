class Player extends GameObject
{
  int ammo;
  
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    this.ammo = 200;
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
      gameObjects.add(new Bullet(this.x, this.y));
      ammo--;
    }
  }
  
  void render()
  {
    update();
    create();
    shapeMode(CORNER);
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
      if(ammo > 0)
      {
        fire();
      }
    }
    
    if(checkKey(DOWN))
    {
    }
  }
}