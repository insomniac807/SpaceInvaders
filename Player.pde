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
    speed = 5;
  }
  
  void fire()
  {
      gameObjects.add(new Bullet(this.x+30, this.y));
      ammo--;
  }
  
  void render()
  {
    update();
    imageMode(CORNER);
    image(sprite, x, y);
  }
  
  
  void update()
  {
    for(int i=0; i<gameObjects.size(); i++)
    {
      GameObject e = gameObjects.get(i);
      if( e instanceof Enemy )
      {
        Enemy a = (Enemy)e;
        if(dist(this.x, this.y, a.x, a.y) < 30 && a.isAlive())
        {
          gameObjects.add(new Explosion(this.x, this.y, 60, 60));
          die();
        }
      }
    }
    if(this.x < -60)
    {
      this.x = 660;
    }
    if(this.x > 660)
    {
      this.x = -60;
    }
    if(checkKey(LEFT))
    {
      rightUp = false;
      speed = 5;
      this.x -= speed;
    }
    
    if(leftUp)
    {
      if(speed >= 0)
      {
        this.x -= speed;
        speed -= 0.2;
      }
      if(speed <= 0)
      {
        leftUp = false;
      }
    }
    
    if(checkKey(RIGHT))
    {
      leftUp = false;
      speed = 5;
      this.x += speed;
    }
    
    if(rightUp)
    {
      if(speed >= 0)
      {
        this.x += speed;
        speed -= 0.2;
      }
      if(speed <= 0)
      {
        rightUp = false;
      }
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