Player player;
ArrayList<Enemy> enemies;

boolean[] keys;

void setup()
{
  //fulScreen();
  size(600,600);
  
  keys = new boolean[1000];
  
  player = new Player(300, 500);
  enemies = new ArrayList<Enemy>();
}

void draw()
{
  background(0);
  player.update();
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