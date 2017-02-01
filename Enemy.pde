class Enemy extends GameObject
{
  float size;
  int health;
  
  void render()
  {
  }
  
  void update()
  {
    if(frameCount % 120 == 0)
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
          if(dist(bullet.x, bullet.y, this.x, this.y) < size/2)
          {
            health --;
            gameObjects.remove(b);
          }   
      }//end if
    }//end for
    
    
  }//end update
}