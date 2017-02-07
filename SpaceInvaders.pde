/*
Bug report: gameObjects.size not setting corretly after level clear, 
instead of 1 player object, list contains player, 10 enemies and 1 bullet.
Possible cause: level2() function in level class reloading too soon or incorectly.
Doesnt explain the missing bullet. Possibly the last bullet to kill enemy doesnt get removed in time?
*/

LevelManager gameScreen;
PFont title, menuOption, gameFont;
ArrayList<GameObject> gameObjects;
Player player;
//mode 0=menu: 1=level1:: menuSelect 0=newgame: 1=quit::
int score, lives, mode, menuSelect,  numEnemies, enemiesLeft;
boolean[] keys;
boolean gameOver;
boolean levelCleared;

void setup()
{
  size(600,600);
  gameScreen = new LevelManager();
  title = loadFont("Chiller-Regular-48.vlw");
  menuOption = loadFont("KristenITC-Regular-48.vlw");
  gameFont = loadFont("ArialMT-48.vlw");
  player = new Player(300, 500);
  gameObjects = new ArrayList<GameObject>();
  score = 0;
  lives = 3;
  mode = 0;
  numEnemies = 20;
  enemiesLeft = numEnemies;
  keys = new boolean[1000];
  gameOver = false;
  levelCleared = false;
  
}//end setup


void draw()
{   
    if(enemiesLeft <= 0)
    {
      levelCleared();
    }
    gameScreen.loadLevel(mode);
    
    for(int i=0; i<gameObjects.size(); i++)
    {
      print(gameObjects.get(i).toString());
    }
}

//resets the current level and player loses a life
void die()
{
  for(int i=0; i<gameObjects.size(); i++)
  {
    GameObject a = gameObjects.get(i);
    if( a instanceof Enemy )
    {
      Enemy en = (Enemy)a;
      en.alive = true;
      en.resetHealth();
      en.y -= 600;
      player.resetAmmo();
    }
  }
  lives--;
}

void levelCleared()
{
      gameScreen.resetGameObjects();
      numEnemies += 20;
      enemiesLeft = numEnemies;
      mode++;
}

void displayStats(Player p)
{
    text("Score: ", 20, height*0.98);
    text(score, 60, height*0.98);
    
    text("Ammo: ", 90, height*0.98);
    text(p.ammo, 140, height*0.98);
    
    text("Lives: ", 180, height*0.98);
    text(lives, 220, height*0.98);
    
}


boolean checkKey(int k)
{
  return keys[k];
}


void keyPressed()
{
  if(mode == 0)
  {
      if(key == 10)
      {
        if(menuSelect == 0)
        {
          mode = 1;
        }
        if(menuSelect == 1)
        {
          mode = 4;
          menuSelect = 3;
        }
      }
      if(keyCode == UP)
      {
        menuSelect = 0;
      }
      
      if(keyCode == DOWN)
      {
        menuSelect = 1;
      }
  }//end if mode0
  else if(mode > 0 && mode < 4 )
  {
    keys[keyCode] = true;
  }//end if mode1
  
  else if(mode == 4)
  {
    if(key == 10)
    {
      if(menuSelect == 2)
      {
        exit();
      }
      else if(menuSelect == 3)
      {
        mode = 0;
        menuSelect = 0;
      }
    }
    if(keyCode == LEFT)
    {
      menuSelect = 2;
    }
    if(keyCode == RIGHT)
    {
      menuSelect = 3;
    }
  }//end if mode4
}


void keyReleased()
{
  keys[keyCode] = false;
}