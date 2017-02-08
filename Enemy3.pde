class Enemy3 extends Enemy
{
  
  Enemy3(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.health = 6;
    this.size = 100;
    this.alive = true;
    this.sprite = loadImage("alien3.png");
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
      en3die.play();
      en3die.rewind();
      score += 3;
      health -= 1;
      gameObjects.add(new Explosion(x, y+20, size, size));
      enemiesLeft--;
    }
  }
  
  void resetHealth()
  {
    this.health = 4;
  }
  
}