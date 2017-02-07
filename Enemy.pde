class Enemy extends GameObject
{
  float size;
  int health;
  
  Enemy()
  {
    this.speed = 0.1;
    this.size = 30;
  }
  
  void render()
  {
  }
  
  void update()
  {
    if(!gameOver)
    {
      y += speed;
    }
    translate(x, y);
    
    for( int i=0; i<gameObjects.size(); i++)
    {
      GameObject b = gameObjects.get(i);
      if( b  instanceof Bullet )
      {
          Bullet bullet = (Bullet) b;
          if(dist(bullet.x, bullet.y, this.x, this.y) < size)
          {  
            if(this.alive)
            {
              this.health --;
              gameObjects.remove(b);
            }
          }   
      }//end if
    }//end for    
    
  }//end update
  
  void resetHealth()
  {}
  
}//end Enemy class