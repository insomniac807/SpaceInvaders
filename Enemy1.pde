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
    if( health > 0 )//if alive display
    {
      imageMode(CENTER);
      image(sprite, x, y);
    }
    else if( health == 0 )//else do not display (keep in arraylist to show empty position)
    {
      this.alive = false;
      enDie.play();
      enDie.rewind();
      gameObjects.add(new Explosion(x, y, size*2, size*2));//explosion animation
      score += 1;//low score for killing easy enemy
      health -= 1;//switch this code off
      enemiesLeft--;
    }
  }
  
  void resetHealth()
  {
    this.health = 2;
  }
  
}