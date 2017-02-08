abstract class GameObject
{
  float x, y, speed;
  PShape shape;
  PImage sprite;
  boolean alive;
  
  abstract void render();
  abstract void update();
}