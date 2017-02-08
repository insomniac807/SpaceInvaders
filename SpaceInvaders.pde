import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer soundtrack, gunshot, enDie, en2die, en3die;
LevelManager gameScreen;
PFont title, menuOption, gameFont;
PImage background;
ArrayList<GameObject> gameObjects;
Player player;
int score, lives, mode, menuSelect,  numEnemies, enemiesLeft, ammoDiffic;
float difficulty;
boolean[] keys;
boolean gameOver;
boolean levelCleared;
boolean leftUp, rightUp, dead;

void setup()
{
  minim = new Minim(this);
  soundtrack = minim.loadFile("level1.mp3");
  gunshot = minim.loadFile("gunshot.wav");
  enDie = minim.loadFile("boom.mp3");
  en2die = minim.loadFile("boom2.mp3");
  en3die = minim.loadFile("boom3.mp3");
  
  difficulty = 0.2;
  ammoDiffic = 150;
  dead = false;
  size(600,600);
  background = loadImage("background.png");
  background.resize(600,600);
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
  leftUp = rightUp = false;
  soundtrack.loop();
  
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
      if(frameCount % 180 < 160)
      {
        textFont(title, 86);
        fill(255, 0, 0);
        text("DIE", width/3, height/2);
      }
      else
      {
        dead = false;
      }
    }
    
}


//resets the current level and player loses a life
void die()
{
  dead = true;
  if(lives > 0)
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
  else
  {
    mode = 8;
  }
}

void levelCleared()
{
      resetGameObjects();
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

void resetGameObjects()
{
  gameObjects.clear();
}

void keyPressed()
{
  if(mode == 0 || mode == 5 || mode == 6 || mode == 7)
  {
      if(key == 10)
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
                  break;
          case 3://quit
                  menuSelect = 11;
                  mode = 7;
                  break;
          case 4://easy
                 difficulty = 0.1;
                 player.ammo = 200;
                 break;
          case 5://med
                  difficulty = 0.2;
                  player.ammo = 150;
                  break;
          case 6://hard
                  difficulty = 0.3;
                  player.ammo = 100;
                  break;
          case 7://insane
                  difficulty = 0.4;
                  player.ammo = 400;
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
          default: break;
        }//end switch
        
      }
      
      if(keyCode == UP && mode != 7)
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
      
      if(keyCode == DOWN && mode != 7)
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
                  if(menuSelect < 8)
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
     
    if(keyCode == LEFT)
    {
      menuSelect = 10;
    }
    if(keyCode == RIGHT)
    {
      menuSelect = 11;
    }
    
  }//end if mode 0, 5 or 6

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
  
}


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