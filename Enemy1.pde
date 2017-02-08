class Enemy1 extends Enemy
{
  
  Enemy1(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.health = 2;
    this.alive = true;
    this.sprite = loadImage("alien1.png");
    sprite.resize(size/2, size);
  }
  
  
  void render()
  {
    update();
    if( health > 0 )
    {
      imageMode(CENTER);
      image(sprite, x, y);
    }
    else if( health == 0 )
    {
      this.alive = false;
      enDie.play();
      enDie.rewind();
      score += 1;
      health -= 1;
      enemiesLeft--;
    }
  }
  
  void resetHealth()
  {
    this.health = 2;
  }
  
}