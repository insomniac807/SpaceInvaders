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
int score, lives, mode, menuSelect,  numEnemies, enemiesLeft;
boolean[] keys;
boolean gameOver;
boolean levelCleared;
boolean leftUp, rightUp;

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
    
}


//resets the current level and player loses a life
void die()
{
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
  lives--;
  enemiesLeft = enCount;
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
    
    if(keyCode == UP)
    {
      gunshot.play();
      gunshot.rewind();
      player.fire();
    }
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
  if(keyCode == LEFT)
  {
    leftUp = true;
  }
  if(keyCode == RIGHT)
  {
    rightUp = true;
  }
}