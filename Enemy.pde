class Enemy extends GameObject
{
  
  int health, size;
  
  Enemy()
  {
    this.speed = 0.1;
    this.size = 60;
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
    
    for( int i=0; i<gameObjects.size(); i++)
    {
      GameObject b = gameObjects.get(i);
      if( b  instanceof Bullet )
      {
          Bullet bullet = (Bullet) b;
          if(dist(bullet.x, bullet.y, this.x, this.y) < size/2)
          {  
            if(this.alive)
            {
              this.health --;
              gameObjects.remove(i);
            }
          }   
      }//end if
    }//end for    
    
  }//end update
  
  void resetHealth()
  {}
  
  String toString()
  {
    return "Enemy";
  }
  
}//end Enemy class