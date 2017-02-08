/*Class used to control .png frame animation*/

class Explosion extends GameObject
{
  PImage[] explosion;//stores .png franes
  float posx, posy;
  int w, h;
  int numFrames, frame;//frame starts at 0 and incriments by 1 each framecount, num frames controls how many frames to iterate per animation cycle
  boolean go;//switch to control on or off
  
  Explosion(float posx, float posy, int w, int h)
  {
    this.posx = posx;
    this.posy = posy;
    this.w = w;
    this.h = h;
    this.go = true;
    this.frame = 0;
    numFrames = 30;
    explosion = new PImage[numFrames];
    for(int i=0; i<numFrames; i++)
    {
      explosion[i] = loadImage("expl\\"+i+".png");
      explosion[i].resize(w, h);
    }
  }
  
  
  void render()
  {
    
    if(go)
    {
      image(explosion[frame], posx, posy);
      frame++;
      if(frame >= numFrames)
      {
        go = false;
        gameObjects.remove(this);
      }
    }
  }
  
  void update()
  {}
  
  
}