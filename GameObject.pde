abstract class GameObject
{
  float x, y, speed;
  PShape shape;
  boolean alive;
  
  abstract void render();
  abstract void update();
}