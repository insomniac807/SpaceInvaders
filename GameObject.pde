abstract class GameObject
{
  float x, y, speed;
  PShape shape;
  
  abstract void render();
  abstract void update();
}