class Enemy2 extends Enemy
{
  
  Enemy2(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.health = 4;
    this.alive = true;
    this.sprite = loadImage("alien2.png");
    sprite.resize(size, size);
  }
  
  void render()
  {
    update();
    imageMode(CENTER);
    if( health > 0)
    {
      image(sprite, x, y);
    }
    else if( health == 0 )
    {
      alive = false;
      score += 3;
      health -= 1;
      enemiesLeft--;
    }
  }
  
  void resetHealth()
  {
    this.health = 4;
  }
  
}