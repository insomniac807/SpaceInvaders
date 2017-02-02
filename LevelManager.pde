public class LevelManager
{
  int mode;
  
  LevelManager()
  {
  }
  
  public void mainMenu()
  {
    background(0);
    textFont(title, 86);
    fill(255);
    text("Space Invaders", width/5, height/4);
    textFont(menuOption, 32);
    if(menuSelect == 0)
    {
      fill(255, 255, 0);
    }
    else
    {
      fill(255);
    }
    text("New Game", width/3, height/2);
    if(menuSelect == 1)
    {
      fill(255, 255, 0);
    }
    else
    {
      fill(255);
    }
    text("Quit", width/2.5, height*0.6);
    
  }//end mainmenu
  
  
  public void level1()
  {
    
    textFont(gameFont, 12);
    background(0);
    
    for( int i=0; i < gameObjects.size(); i++)
    {
      gameObjects.get(i).render();
      
      if(gameObjects.get(i) instanceof Enemy)
      {
        if(gameObjects.get(i).y == 600)
        {
          lives--;
          if(lives <= 0)
          {
            gameOver = true;
            lives = 0;
          }
         }
       }
      }//end for
    
    displayStats(player);
    
  }//end level1
  
}//end class