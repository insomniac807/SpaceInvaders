LevelManager gameScreen;
PFont title, menuOption, gameFont;
ArrayList<GameObject> gameObjects;
Player player;
//mode 0=menu: 1=level1:: menuSelect 0=newgame: 1=quit::
int score, lives, mode, menuSelect,  numEnemies;
boolean[] keys;
boolean gameOver;

void setup()
{
  size(600,600);
  gameScreen = new LevelManager();
  title = loadFont("Chiller-Regular-48.vlw");
  menuOption = loadFont("KristenITC-Regular-48.vlw");
  gameFont = loadFont("ArialMT-48.vlw");
  player = new Player(300, 500);
  score = 0;
  lives = 3;
  mode = 0;
  numEnemies = 20;
  keys = new boolean[1000];
  gameOver = false;
  gameObjects = new ArrayList<GameObject>();
  gameObjects.add(player);
  
  for( int i=0; i<numEnemies/2; i++)
  {
    gameObjects.add(new Enemy1(i*60+40, 50));
    gameObjects.add(new Enemy2(i*60+40, -15));
  }
  
}//end setup


void draw()
{
  switch (mode)
  {
    case 0: gameScreen.mainMenu();
            break;
    case 1: gameScreen.level1();
            break;
    case 4: gameScreen.quitScreen();
            break;
  }
}

void die()
{
  for(int i=0; i<gameObjects.size(); i++)
  {
    GameObject en = gameObjects.get(i);
    if( en instanceof Enemy )
    {
      en.y -= 600;
    }
  }
  lives--;
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
  else if(mode == 1)
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