//-----------------------------------------------------------Class-----------------------------------------------------------------------------------------------------
class Hook
{
  int x;
  int y;
  int speedX;
  int speedY;
  int fishingLine;
  int sizeX;
  int sizeY;
  PImage hook;

Hook (int x, int y, int speedX, int speedY, int fishingLine, int sizeX, int sizeY)
{
  this.x = x;
  this.y = y;
  this.speedX = speedX;
  this.speedY = speedY;
  this.fishingLine = fishingLine;
  this.sizeX = sizeX;
  this.sizeY = sizeY;
  hook = loadImage("hook.png");
}

//-----------------------------------------------------------Hook Collision--------------------------------------------------------------------------------------------
void hookCollision() 
{
  if (hook1.y > height - 50) //if y value of the hook is greater than the height minus the size of my hook; the hook drops.
  {
  hookDown = 2;
  }
  if(hook1.y <= 300) // this makes my hook stop as soon as it gets to the Y value of the screen which is 300.
  {
  hookDown = 0;
  }
}
 
//---------------------------------------------------Move functions for the x and y position---------------------------------------------------------------------------
void moveX(int speedX) // this is where my line increases everytime a key is pressed in my main_class.
{
  x = x + speedX; // setting up the speed of the hook in the x - axis
  fishingLine = fishingLine + speedX; // setting up the speed of the line in the x-direction.
}

void moveY(int speedY) 
{
  y = y + 5*speedY; // this is what makes the hook go down smoothly with the speed of 5
}

//-----------------------------------------------------------Line + hook image-----------------------------------------------------------------------------------------
void draw()
{
  line(fishingLine + 2, 290, x + 82, y-20); 
  image(hook, x , y, sizeX,sizeY);// draws the images 
}
}