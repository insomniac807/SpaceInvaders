class Enemy extends GameObject
{
  
  int health, size;
  
  Enemy()
  {
    this.speed = difficulty;
    this.size = 60;
  }
 
  boolean isAlive()
  {
    return this.alive;
  }
  
  void render()
  {
  }
  
  void update()
  {
    if(!gameOver)
    {
      y += speed;
      if(y > player.y && this.isAlive())//if alive enemy goes past player
      {
        die();//player die
      }
    }
    
    for( int i=0; i<gameObjects.size(); i++)
    {
      GameObject b = gameObjects.get(i);
      if( b  instanceof Bullet )//collision detection
      {
          Bullet bullet = (Bullet) b;
          if(dist(bullet.x, bullet.y, this.x, this.y) < size/2)
          {  
            if(this.alive)
            {
              this.health --;
              gameObjects.remove(i);//kill bullet
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