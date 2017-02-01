Player player;
ArrayList<Enemy1> easyEn;
ArrayList<Enemy2> medEn;
int numEnemies;

boolean[] keys;

void setup()
{
  //fulScreen();
  size(600,600);
  
  numEnemies = 10;
  
  keys = new boolean[1000];
  
  player = new Player(300, 500);
  easyEn = new ArrayList<Enemy1>();
  medEn = new ArrayList<Enemy2>();
  
  for( int i=0; i<numEnemies; i++)
  {
    easyEn.add(new Enemy1(i*60+25, 50));
  }
  for( int i=0; i<numEnemies; i++)
  {
    medEn.add(new Enemy2(i*60+10, -15));
  }
}//end setup


void draw()
{
  background(0);
  player.update();
  
  for( int i=0; i < easyEn.size(); i++)
  {
    easyEn.get(i).render();
  }
  for( int i=0; i < medEn.size(); i++)
  {
    medEn.get(i).render();
  }
}


boolean checkKey(int k)
{
  return keys[k];
}


void keyPressed()
{
  keys[keyCode] = true;
}


void keyReleased()
{
  keys[keyCode] = false;
}