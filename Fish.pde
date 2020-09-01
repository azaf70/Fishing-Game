//------------------------------------------------------------class----------------------------------------------------------------------------------------------------
class Fish
{
  int x, y; // variables
  int speedX, speedY;
  int counter;
  PImage limg;
  PImage rimg;
  PImage raniimg;
  PImage laniimg;


  Fish( PImage limg, PImage rimg, PImage raniimg, PImage laniimg, int x, int y, int speedX, int speedY) 
  {
    this.x = x; 
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    this.limg = limg;
    this.rimg = rimg;
    this.raniimg = raniimg;
    this.laniimg = laniimg;
  }

  //---------------------------------------------------------------------Animation---------------------------------------------------------------------------------------
  void render()  
  {
    counter++;  // used for the animation
    if (speedX == -1 && counter < 30) // shows the right images when the fishes go in the opposite direction
      image(rimg, x, y);
    else if (speedX == -1 && counter < 60 )
      image(raniimg, x, y);
    else if (speedX == 1  && counter < 30)// shows the left images when the fishes go in the positive direction; 
      image(limg, x, y);
    else if (speedX == 1  && counter < 60) // shows the flipped images as I set the counter to 60 for two sets of images.
      image(laniimg, x, y);
    if ( counter  > 60 )
      counter = 0;
  }

  //---------------------------------------------------------------Side collision----------------------------------------------------------------------------------------
  void collide() 
  {
    if (x<0 || x> width - 200) // this means that if x<0 or x> width - the size of my fish then do whatever is in the brackets
    {
      speedX = - speedX; 
      y = y - 50; // takes the images up by 50 spaces
    }
  }

  //-----------------------------------------------------------Hook Collision--------------------------------------------------------------------------------------------
  void collision()
  {
    boolean CRASH; // boolean statements
    if ( this.y > hook1.y + hook1.sizeY ||  this.x > hook1.x + hook1.sizeX || this.x+200 < hook1.x + hook1.sizeX)
    {
      CRASH = false;
    } else
    {
      CRASH = true;
    }
    if (CRASH == true)
    {
      hookDown = 2;
      this.y = hook1.y;
      this.x = hook1.x;

      //-----------------------------------------------------------Score + Hook Reset----------------------------------------------------------------------------------------
      if (this.y <= 330)
      {
        this.x = width;
        this.speedX =0;
        score = score + 5;
      }
    }
    
    if (gameMode == level1 && score == 80)
    {
      gameMode = complete1;
    }
    
    if (gameMode == level2 && score == 80)
    {
      gameMode = gameOver;
    }
  }

  //-----------------------------------------------------------Boat Collision--------------------------------------------------------------------------------------------
  void boatCollision()
  {
    Boolean boatCrash;
    if (this.y >= fisherman1.y + 300 || this.x  + fisherman1.x + 400 < fisherman1.x || this.x+200 > fisherman1.x  + 300)
    {
      boatCrash = false;
    } else
    {
      boatCrash = true;
    }
    if (boatCrash == true)
    {
      gameMode = gameOver;
    }
  }

  //-----------------------------------------------------------Moves the fish--------------------------------------------------------------------------------------------
  void move()
  {
    x = x - 10*speedX;
  }
  
  void move2()
  {
    x = x - 15*speedX;
  }
}