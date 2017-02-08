public class Level
{
  
  Level()
  {}
  
  
  public void resetGameObjects()
  {
    gameObjects.clear();
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
    player.ammo = 200;
    if(gameObjects.size() < 2)
    {
      gameObjects.add(player);
      for( int i=0; i<numEnemies/2; i++)
      {
        gameObjects.add(new Enemy1(i*60+30, 50));
        gameObjects.add(new Enemy2(i*60+30, -15));
      }
    }
    
  }
  
  public void level2()
  {
    player.ammo = 300;
    if(gameObjects.size() < 2)
    {
        gameObjects.add(player);
        int ypos = 50;
        for( int i=0; i<10; i++)
        { 
          gameObjects.add(new Enemy1(i*60+40, ypos));
        }
        for(int i=0; i<10; i++)
        {
          gameObjects.add(new Enemy1(i*60+40, ypos-65));
        }
        for(int i=0; i<10; i++)
        { 
          gameObjects.add(new Enemy2(i*60+40, ypos-130));
        }
        for(int i=0; i<10; i++)
        {
          gameObjects.add(new Enemy2(i*60+40, ypos-190));
        }
        
    }
  }
  
  public void level3()
  {
    player.ammo = 400;
    if(gameObjects.size() < 2)
    {
      gameObjects.add(player);
        int ypos = 50;
        for( int i=0; i<10; i++)
        { 
          gameObjects.add(new Enemy1(i*60+40, ypos));
        }
        for(int i=0; i<10; i++)
        {
          gameObjects.add(new Enemy1(i*60+40, ypos-65));
        }
        for(int i=0; i<10; i++)
        { 
          gameObjects.add(new Enemy2(i*60+40, ypos-130));
        }
        for(int i=0; i<10; i++)
        {
          gameObjects.add(new Enemy3(i*60+40, ypos-190));
        }
        for(int i=0; i<10; i++)
        {
          gameObjects.add(new Enemy1(i*60+40, ypos-190));
        }
        for(int i=0; i<10; i++)
        {
          gameObjects.add(new Enemy2(i*60+40, ypos-190));
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