public class Level
{
  
  Level()
  {}
  
  
  public void mainMenu()
  {
    background(0);
    textFont(title, 86);
    fill(255);
    text("Space Invaders", width/5, height/4);
    textFont(menuOption, 32);
    if(menuSelect == 0)
    {
      fill(0, 255, 0);
    }
    else
    {
      fill(255);
    }
    text("New Game", width/3, height/2);
    if(menuSelect == 1)
    {
       fill(0, 255, 0); 
    }
    else
    {
      fill(255);
    }
    text("Difficulty", width/3, height*0.6);
    if(menuSelect == 2)
    {
      fill(0, 255, 0);
    }
    else
    {
      fill(255);
    }
    text("Controls", width/2.9, height*0.7);
    if(menuSelect == 3)
    {
      fill(0, 255, 0);
    }
    else
    {
      fill(255);
    }
    text("Quit", width/2.5, height*0.8);
    
  }//end mainmenu
   
  
  public void gameOver()
  {
    background(0);
    textFont(title, 86);
    fill(255);
    text("You Died!!!", width/3, height/2);
    textFont(menuOption, 32);
    fill(0, 255, 0);
    text("Main Menu", width/3, height*0.7);
  }
   
   
  public void level1()
  {
    if(gameObjects.size() < 2)
    {
      numEnemies = 20;
      enemiesLeft = numEnemies;
      resetGameObjects();
      player.ammo = 200;
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
    if(gameObjects.size() < 2)
    {
        numEnemies = 40;
        enemiesLeft = numEnemies;
        resetGameObjects();
        player.ammo = 300;
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
    if(gameObjects.size() < 2)
    {
      numEnemies = 60;
      enemiesLeft = numEnemies;
      resetGameObjects();
      player.ammo += ammoDiffic;
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
          gameObjects.add(new Enemy3(i*60+20, ypos-240));
        }
        for(int i=0; i<10; i++)
        {
          gameObjects.add(new Enemy1(i*60+40, ypos-250));
        }
        for(int i=0; i<10; i++)
        {
          gameObjects.add(new Enemy2(i*60+40, ypos-310));
        }
    }
    
  }
  
  
  public void difficulty()
  {
    background(0);
    textFont(menuOption, 32);
    text("Easy", width/2.5, height*0.2);
    text("Normal", width/3, height*0.4);
    text("Hard", width/3, height*0.6);
    text("Impossible", width/3, height*0.8);
  }
  
  public void controls()
  {
    background(0);
    textFont(title, 86);
    text("Controls", width/4, height*0.1);
  }
  
  public void winScreen()
  {
    menuSelect = 12;
    background(0);
    fill(255);
    textFont(title, 86);
    text("WINNER", width/4, height/2);
    textFont(menuOption, 32);
    fill(0, 255, 0);
    text("Main Menu", width/3, height*0.7);
  }
  
  public void quitScreen()
  {
    background(0);
    textFont(title, 86);
    fill(255);
    text("Quit, Are You Sure?", width/9, height/4);
    textFont(menuOption, 32);
    if(menuSelect == 10)
    {
        fill(0, 255, 0);
    }
    else
    {
      fill(255);
    }
    text("YES", width/6, height/2);
    if(menuSelect == 11)
    {
        fill(0, 255, 0);
    }
    else
    {
      fill(255);
    }
    text("NO", width*0.7, height/2);
    
  }//end quitScreen()
}