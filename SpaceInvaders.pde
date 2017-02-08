import ddf.minim.*;
Minim minim;
AudioPlayer soundtrack, gunshot, enDie, en2die, en3die;
LevelManager gameScreen;
PFont title, menuOption, gameFont;
PImage background;
ArrayList<GameObject> gameObjects;
Player player;
int score, lives, mode, menuSelect,  numEnemies, enemiesLeft, ammoDiffic, selected;
float difficulty;
boolean[] keys;
boolean leftUp, rightUp, dead, levelUp, levelCleared, gameOver;

void setup()
{
  minim = new Minim(this);
  soundtrack = minim.loadFile("level1.mp3");
  gunshot = minim.loadFile("gunshot.wav");
  enDie = minim.loadFile("boom.mp3");
  en2die = minim.loadFile("boom2.mp3");
  en3die = minim.loadFile("boom3.mp3");
  
  size(600,600);
  background = loadImage("background.png");
  background.resize(600,600);
  gameScreen = new LevelManager();//runs code for different screens based on mode value
  title = loadFont("Chiller-Regular-48.vlw");
  menuOption = loadFont("KristenITC-Regular-48.vlw");
  gameFont = loadFont("ArialMT-48.vlw");//for player stats
  player = new Player(300, 500);
  gameObjects = new ArrayList<GameObject>();
  mode = 0;//mode controls menu and game screens
  score = 0;
  lives = 3;
  numEnemies = 20;//level 1
  difficulty = 0.2;//init to normal mode
  ammoDiffic = 150;//init to normal mode
  enemiesLeft = numEnemies;//enemies left updates as enemies die
  keys = new boolean[1000];//only used in gameMode to move player (possibly too big?)
  leftUp = rightUp = gameOver = levelCleared = false;//left up and right up implement low level physics on player object 
  dead = false;//start alive
  levelUp = true;//used to display current level to player at start of level
  soundtrack.loop();//one mp3 file on loop (current game likely cleared before 5 mins)
  
}//end setup


void draw()
{   
    if(enemiesLeft <= 0)
    {
      levelCleared();
    }
    
    gameScreen.loadLevel(mode);
    
    if(dead)
    {
      if(frameCount % 180 < 160 && lives > 0)//controls when and how long text is displayed for
      {
        textFont(title, 86);
        fill(255, 0, 0);
        text("DIE", width/3, height/2);
      }
      else
      {
        dead = false;//switch off after 1 iteration
      }
    }
    
    if(levelUp && mode < 4 && mode > 0)//only display if in game mode
    {
      if(frameCount % 300 < 240)
      {
        textFont(title, 86);
        fill(0, 255, 0);
        text("Level "+mode, width/3, height/2);
      }
      else
      {
        levelUp = false;//same as above
      }
      
    }
    
}//end setup()


//resets the current level and player loses a life
void die()
{
  dead = true;//switches on display message
  if(lives > 0)//if player still has lives reset the level
  {
      lives--;
      int enCount = 0;
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
          enCount++;
        }
      }
      enemiesLeft = enCount;
  }
  else//else go to game over screen
  {
    mode = 8;
    menuSelect = 12;
  }
}


void levelCleared()//advance through game levels
{
      if(mode <= 3)//only 3 levels
      {
        levelUp = true;
        enemiesLeft = 1;
        resetGameObjects();
        mode++;
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


void resetGameObjects()//clears the array list, array list changes between levels
{
  gameObjects.clear();
}


void keyPressed()
{
  if(mode == 0 || mode == 4 || mode == 5 || mode == 6 || mode == 7 || mode == 8)//all menu screens
  {
      if(key == 10)//return key
      {
        
        switch(menuSelect)
        {
          case 0://new game
                  resetGameObjects();
                  numEnemies = 20;
                  score = 0;
                  mode = 1;
                  break;
          case 1://difficluty
                  mode = 5;
                  break;
          case 2://controls
                  mode = 6;
                  menuSelect = 9;
                  break;
          case 3://quit
                  menuSelect = 11;
                  mode = 7;
                  break;
          case 4://easy
                 difficulty = 0.1;
                 player.ammo = 200;
                 selected  = 4;
                 break;
          case 5://med
                  difficulty = 0.2;
                  player.ammo = 150;
                  selected = 5;
                  break;
          case 6://hard
                  difficulty = 0.3;
                  player.ammo = 100;
                  selected = 6;
                  break;
          case 7://insane
                  difficulty = 0.4;
                  player.ammo = 400;
                  selected = 7;
                  break;
          case 8://ok difficulty
                  mode = 0;
                  break;
          case 9://control return
                  mode = 0;
                  break;
          case 10://yes quit
                  exit();
          case 11://no quit
                   mode = 0;
                   break;
                   
          case 12://game over, continue
                    mode = 0;
                    menuSelect = 0;
                    break;
                    
          default: break;
        }//end switch
        
      }

      
      if(keyCode == UP && mode != 7)//scroll up menu options
      {
        menuSelect--;
        switch(mode)
        {
          case 0:
                  if(menuSelect < 0)
                  {
                    menuSelect = 3;
                  }
                  break;
                
          case 5:
                  if(menuSelect < 4)
                  {
                     menuSelect = 8;
                  }
                  break;
                  
          case 6:
                  menuSelect = 8;
                  
          default:
                  break;
                    
        }//end switch
      }//end key == up
      
      if(keyCode == DOWN && mode != 7)//scroll down menu options
      {
        menuSelect++;
        switch(mode)
        {
          case 0:
                  if(menuSelect > 3)
                  {
                    menuSelect = 0;
                  }
                  break;
                
          case 5:
                  if(menuSelect > 8)
                  {
                     menuSelect = 4;
                  }
                  break;
                  
          case 6:
                  menuSelect = 9;      
                  
          default:
                   break;
        }//end switch 
      }//end if key == down
     
    if(keyCode == LEFT && mode == 7)//left and right menu options for quit screen only
    {
      menuSelect = 10;
    }
    if(keyCode == RIGHT && mode == 7)
    {
      menuSelect = 11;
    }
    
  }//end if 

  else if(mode > 0 && mode < 4 )//in game mode
  {
    keys[keyCode] = true;
    
    if(keyCode == UP)
    {
      gunshot.play();
      gunshot.rewind();
      player.fire();
    }
  }//end if game mode
  
}//end keyPressed()


void keyReleased()
{
  keys[keyCode] = false;
  if(keyCode == LEFT)
  {
    leftUp = true;
  }
  if(keyCode == RIGHT)
  {
    rightUp = true;
  }
}