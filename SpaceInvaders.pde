LevelManager gameScreen;
Player player;
PFont title, menuOption, gameFont;

ArrayList<GameObject> gameObjects;

int numEnemies;
//mode 0=menu: 1=level1:: menuSelect 0=newgame: 1=quit::
int score, lives, mode, menuSelect;

boolean[] keys;
boolean gameOver;

void setup()
{
  //fulScreen();
  size(600,600);
  gameScreen = new LevelManager();
  title = loadFont("Chiller-Regular-48.vlw");
  menuOption = loadFont("KristenITC-Regular-48.vlw");
  gameFont = loadFont("ArialMT-48.vlw");
  player = new Player(300, 500);
  numEnemies = 10;
  score = 0;
  lives = 3;
  mode = 0;
  
  keys = new boolean[1000];
  gameOver = false;
  gameObjects = new ArrayList<GameObject>();
  gameObjects.add(player);
  
  for( int i=0; i<numEnemies; i++)
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
  }
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
      if(keyCode == LEFT)
      {
        if(menuSelect == 0)
        {
          mode = 1;
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
  }
  
  else if(mode == 1)
  {
    keys[keyCode] = true;
  }
}


void keyReleased()
{
  keys[keyCode] = false;
}