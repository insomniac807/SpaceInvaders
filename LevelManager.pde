public class LevelManager extends Level
{
  int mode, levelNo;
  boolean levelSetup;
  LevelManager()
  {
    levelSetup = false;
    levelNo = 1;
    
  }
  

  
  
  public void loadLevel(int levelNo)
  {
     switch(levelNo)
     {
       case 0:  mainMenu();
                break;
                
       case 1:  playGame(levelNo);
                break;
       
       case 2: playGame(levelNo);
               break;
               
       case 3: playGame(levelNo);
               break;
                
       case 4:  quitScreen();
                break;
     }
  }//end loadLevel()
  
  
  
  public void playGame(int levelNo)
  {
    if(levelNo == 1)
    {
      level1();
    }
    if(levelNo == 2)
    {
      level2();
    }
    if(levelNo == 3)
    {
      level3();
    }
    
    textFont(gameFont, 12);
    background(background);
    
    for( int i=0; i < gameObjects.size()-1; i++)
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
      }//end outer if
      
      if(gameObjects.get(i) instanceof Bullet)
      {
        Bullet b = (Bullet)gameObjects.get(i);
        if(b.y <= 0)
        {
          gameObjects.remove(i);
        }
      }
    }//end for
    
    displayStats(player);
    
  }//end playGame()
  
  

  
}//end class