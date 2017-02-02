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
      if(frameCount % 120 < 100)
      {
        fill(0, 255, 0);
      }
      else
      {
        fill(255);
      }
    }
    else
    {
      fill(255);
    }
    text("New Game", width/3, height/2);
    if(menuSelect == 1)
    {
      if(frameCount % 120 < 100)
      {
        fill(0, 255, 0);
      }
      else
      {
        fill(255);
      }
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
        Enemy en = (Enemy)gameObjects.get(i);
        if(en.y == 600 && en.alive)
        {
          die();
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
  
  
  public void quitScreen()
  {
    background(0);
    textFont(title, 86);
    fill(255);
    text("Quit, Are You Sure?", width/9, height/4);
    textFont(menuOption, 32);
    if(menuSelect == 2)
    {
      if(frameCount % 120 < 100)
      {
        fill(0, 255, 0);
      }
      else
      {
        fill(255);
      }
    }
    else
    {
      fill(255);
    }
    text("YES", width/6, height/2);
    if(menuSelect == 3)
    {
      if(frameCount % 120 < 100)
      {
        fill(0, 255, 0);
      }
      else
      {
        fill(255);
      }
    }
    else
    {
      fill(255);
    }
    text("NO", width*0.7, height/2);
    
  }//end quitScreen()
  
}//end class