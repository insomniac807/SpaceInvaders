public class Level
{
  
  Level()
  {}
  
  
  public void resetGameObjects()
  {
    for(int i=0; i < gameObjects.size(); i++)
    {
      GameObject g = gameObjects.get(i);
      if( g instanceof Player)//empty gameObjects except for player before loading new level elements
      {}
      else
      {
        gameObjects.remove(g);
      }
    }
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
    if(gameObjects.size() < 2)
    {
      for( int i=0; i<numEnemies/2; i++)
      {
        gameObjects.add(new Enemy1(i*60+40, 50));
        gameObjects.add(new Enemy2(i*60+40, -15));
      }
    }
    
  }
  
  
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
}