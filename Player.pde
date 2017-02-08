class Player extends GameObject
{
  int ammo;
  
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    this.ammo = 200;
    this.sprite = loadImage("player.png");
    sprite.resize(60, 40);
    speed = 2;
  }
  
  void fire()
  {
    if(/*frameCount % 5 == 0*/true)
    {
      gameObjects.add(new Bullet(this.x+30, this.y));
      ammo--;
    }
  }
  
  void render()
  {
    update();
    imageMode(CORNER);
    image(sprite, x, y);
  }
  
  
  void update()
  {
    if(checkKey(LEFT))
    {
      this.x -= speed;
    }
    
    if(checkKey(RIGHT))
    {
      this.x += speed;
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
  
  void resetAmmo()
  {
    this.ammo = 200;
  }
  
  String toString()
  {
    return "Player";
  }
}