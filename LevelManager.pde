/*Class containing control code. Decides which display code to run, 
any menus or game levels*/

public class LevelManager extends Level
{
  int mode, level;
  LevelManager()
  {
  }
  

  public void loadLevel(int levelNo)//gets past mode from main class
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
                
       case 4: winScreen();
               break;
                
       case 5: difficulty();
               break;
            
       case 6: controls();
               break;
               
       case 7: quitScreen();
               break;
       
       case 8: gameOver();
               break;
     }
  }//end loadLevel()
  
  
  
  public void playGame(int levelNo)//gets passed mode from load level method
  {
    this.level = levelNo;
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
  
  public int getLevel()
  {
    return this.level;
  }
  
  

  
}//end class