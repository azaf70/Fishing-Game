//-----------------------------------------------------------Class-----------------------------------------------------------------------------------------------------
class jellyFish
{
  int x;
  int y;
  int speedY;
  PImage jellyfish;

jellyFish ( int x, int y, int speedY)
{
  this.x = x;
  this.y = y;
  this.speedY = speedY;
  jellyfish = loadImage("jellyfish.png");
  jellyfish.resize(300,225);
}

//--------------------------------------------------------Top screen Collision-----------------------------------------------------------------------------------------
void collideTopScreen()
{
    y = height;
    this.x = int(random(0,width - 225 ));
    moveJF();
}

//---------------------------------------------------------Jellyfish Collision + lives---------------------------------------------------------------------------------
void collisionJF()
{
  Boolean CRASHJF;
   if ( this.y > fisherman1.y + 300 ||  this.x > fisherman1.x+400 || this.x + 300 < fisherman1.x)
    {
      CRASHJF = false;
    } 
    else
    {
      CRASHJF = true;
    }
    
    if( CRASHJF == true)
    {
       
      lives = lives - 1;
      collideTopScreen();
    }
    
    if (lives <= 0)
    {
      gameMode = gameOver;
    }
}

//-----------------------------------------------------------Moves the jellyfish---------------------------------------------------------------------------------------
void moveJF()
{
  if(y<=0)
  {
    y = height;
  }
  y = y - speedY;
  
}

//-----------------------------------------------------------Draws the jellyfish---------------------------------------------------------------------------------------
void draw()
{
  image(jellyfish,x,y);
}

}