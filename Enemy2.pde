class Enemy2 extends Enemy//same as enemy one with differnt sprite and more health, enemy types from weakest to strongest 1 < 2 < 3
{
  
  Enemy2(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.health = 5;
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
      en2die.play();
      gameObjects.add(new Explosion(x, y, size, size));
      en2die.rewind();
      score += 3;//more points for killing this type
      health -= 1;
      enemiesLeft--;
    }
  }
  
  void resetHealth()
  {
    this.health = 4;
  }
  
}