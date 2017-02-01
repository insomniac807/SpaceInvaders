Player player;

ArrayList<GameObject> gameObjects;

int numEnemies;

boolean[] keys;

void setup()
{
  //fulScreen();
  size(600,600);
  
  numEnemies = 10;
  
  keys = new boolean[1000];
  gameObjects = new ArrayList<GameObject>();
  gameObjects.add(new Player(300, 500));
  
  for( int i=0; i<numEnemies; i++)
  {
    gameObjects.add(new Enemy1(i*60+25, 50));
    gameObjects.add(new Enemy2(i*60+10, -15));
  }
  
}//end setup


void draw()
{
  background(0);
  
  for( int i=0; i < gameObjects.size(); i++)
  {
    gameObjects.get(i).render();
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