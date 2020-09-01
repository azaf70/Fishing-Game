//--------------------------------------------------PImages------------------------------------------------------------------------------------------------------------
PImage background; // contains fields of the width and height of an image
PImage background1;
PImage [] lfishImages = new PImage [6]; //thats the amount of images you can load for lfishimages
PImage [] rfishImages = new PImage [6];
PImage [] ranifishImages = new PImage [6];
PImage [] lanifishImages = new PImage [6];
PImage splashscreen; 
PImage completelevel1;
PImage completelevel2;
PImage gameOverImg;
Fish[][] myArray = new Fish[4][4]; // shows the rows and columns
Boolean topCrash;

//--------------------------------------------------Fundamental Variables----------------------------------------------------------------------------------------------
int x=100;
int y=600; 
int hookDown = 0;
int bX = 0; //x value for the background
int score;
int lives = 3;
final int FINISH = 1;
final int level1 = 2;
final int level2 = 3;
final int gameOver = 4;
final int SPLASHSCREEN = 5;
final int complete1 = 6;
int gameMode = SPLASHSCREEN;

//-----------------------------------------Declairing objects----------------------------------------------------------------------------------------------------------
Timer startTimer; 
Fisherman fisherman1;
Fish fishRend;
Hook hook1;
jellyFish jellyfish1;
jellyFish jellyfish2;
jellyFish jellyfish3;

//-----------------------------------------Setting up the Background + Splashscreen + gameover-------------------------------------------------------------------------
void setup()
{
  background = loadImage("background.png");
  background1 = loadImage("background1.png");
  background.resize(width, height);
  background1.resize(width, height);
  size(1800, 1600);
  completelevel1 = loadImage("level1.png");
  completelevel1.resize(width, height);
  splashscreen = loadImage("start.png");
  splashscreen.resize(width, height);
  gameOverImg= loadImage("gameover.png");
  gameOverImg.resize(width, height);
  gameInit();
}

//----------------------------------------Loading all the images+ setting up the location and values-------------------------------------------------------------------
void gameInit()
{
  int x=100;
  int y=600;
  fisherman1 = new Fisherman(200, 50);
  hook1 = new Hook(505, 330, 50, 50, fisherman1.x + 385, 100, 90);
  jellyfish1 = new jellyFish(900, 1400, 2);
  jellyfish2 = new jellyFish(500, 900, 2);
  jellyfish3 = new jellyFish(800, 500, 2);
  startTimer = new Timer(50);

  for (int i = 0; i < lfishImages.length; i++) // loads all the images
  {
    lfishImages [i] = loadImage ("leftimg"+i+".png"); //+i shows the images from 0 to 5 at the end of their names e.g; leftimages1,leftimages2. 
    lfishImages[i].resize(200, 125);
  }

  for (int i = 0; i < rfishImages.length; i++)
  {
    rfishImages [i] = loadImage ("rightimg"+i+".png");
    rfishImages[i].resize(200, 125);
  }
  for (int i = 0; i < ranifishImages.length; i++)
  {
    ranifishImages [i] = loadImage ("aniRimg"+i+".png");
    ranifishImages[i].resize(200, 125);
  }

  for (int i = 0; i < lanifishImages.length; i++)
  {
    lanifishImages [i] = loadImage ("aniLimg"+i+".png");
    lanifishImages[i].resize(200, 125);
  }


  for (int i = 0; i < myArray.length; i++)
  {
    for (int j = 0; j < myArray[i].length; j++)
    {
      int index = int(random(0, lfishImages.length)); //chooses a random image
      myArray [i][j] = new Fish (lfishImages[index], rfishImages[index], ranifishImages[index], lanifishImages[index], x, y+400, 1, 5); //shows all the images on the screen .e.g; location and speed.
      y = y + 150; // moves all the images up by 150
    }
    x = x + 250; 
    y = 600;
  }
}

//-------------------------------------Background+ drawing everything on the screen------------------------------------------------------------------------------------

void backgroundDraw(int speed)
{
  image(background1, bX, 0); //draw background twice adjacent
  image(background, bX+background.width, 0); //keeps adding up the background
  bX -= speed; // controls the speed of the background
  if (bX == -background.width)
    bX=0; //wrap background
}
void levels() // shows everything on the screen
{
  fisherman1.draw();
  hook1.draw();
  startTimer.countDown();
  startTimer.timer0();

  if (gameMode == level1)
  {
    jellyfish1.draw();
    jellyfish1.moveJF();
    jellyfish2.draw();
    jellyfish2.moveJF();
    jellyfish1.collisionJF();
    jellyfish2.collisionJF();
  } else if (gameMode == level2)
  {
    jellyfish1.draw();
    jellyfish1.moveJF();
    jellyfish2.draw();
    jellyfish2.moveJF();
    jellyfish1.collisionJF();
    jellyfish2.collisionJF();
    jellyfish3.draw();
    jellyfish3.moveJF();
    jellyfish3.collisionJF();
  }

  //----------------------------------Rectangle + score + lives + timer + fish ------------------------------------------------------------------------------------------
  fill(0);
  textSize(40);
  fill(199, 169, 128);
  rect(10, 10, 290, 150, 30, 3, 30, 3);
  fill(0);
  textSize(40);
  text("Time Left: ", 15, 60);
  text( startTimer.getTime(), 216, 60);
  text( "Score: ", 15, 100);
  text( score, 150, 100);
  text( "Lives: ", 15, 140);
  text( lives, 150, 140);

  for ( int i = 0; i< myArray.length; i++) // draws the image
  {
    for ( int j = 0; j< myArray[i].length; j++)
    {
      if (gameMode == level1)
      {
        myArray [i][j].move();
      } else if (gameMode == level2)
      {
        myArray [i][j].move2();
      }

      myArray[i][j].render();
      myArray[i][j].collide();
      myArray[i][j].collision();
      myArray[i][j].boatCollision();
    }
  }

  //-------------------------------------------------- hook drop down+ SplashScreen--------------------------------------------------------------------------------------
  if (hookDown == 1)
  {
    hook1.moveY(5);
  } else  if (hookDown == 2)
  {
    hook1.moveY(-5);
  }
  hook1.hookCollision();
}


void draw()
{
  if (gameMode == SPLASHSCREEN)
  {
    image(splashscreen, 0, 0);
  } else if (gameMode == gameOver)
  {
    fill(97, 136, 194);
    textSize(60);
    rect(10, 700, 400, 900, 3, 6, 12, 18);
    fill(0);
    textSize(40);
    text(score, 200, 200);
    image(gameOverImg, 0, 0);
  } else if (gameMode == level1)
  {
    backgroundDraw(2);
    levels();
  } else  if (gameMode == complete1)
  {
    image(completelevel1, 0, 0);
  } else if (gameMode == level2)
  {
    backgroundDraw(2);
    levels();
  } else if (gameMode == FINISH)
  {
    image(gameOverImg, 0, 0);
    fill(0);
    textSize(40);
    fill(199, 169, 128);
    rect(10, 10, 290, 150, 30, 3, 30, 3);
    fill(0);
    textSize(40);
    text("Time Left: ", 15, 60);
    text( startTimer.getTime(), 216, 60);
    text( "Score: ", 15, 100);
    text( score, 150, 100);
    text( "Lives: ", 15, 140);
    text( lives, 150, 140);
  }
}

//-------------------------------------------------Keyboard functions--------------------------------------------------------------------------------------------------
void keyPressed()
{

  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      if ( fisherman1.x < width-420) //the boat will not go beyond the screen
      {
        fisherman1.move(10);
        hook1.moveX(10);
      }
    } else if (keyCode == LEFT) // moves the fisherman left
    {
      if ( fisherman1.x>0) 
      {
        fisherman1.move(-10);
        hook1.moveX(-10);
      }
    }
    if (keyCode == DOWN && hookDown == 0) //if the hook is at the stationary position and the down button is pressed the hook will go down
    {
      hookDown = 1;
    }
  }

  if (gameMode == SPLASHSCREEN)
  {
    if (key == ' ')
    {
      gameMode = level1;
      startTimer.begin = millis();
      startTimer.duration = 70;
    }
  }
  if (gameMode == gameOver)
  {
    if (key == ' ')

    {
      gameMode = level1;
      gameInit();
      startTimer.begin = millis();
      startTimer.duration = 70;
      score = 0;
      lives = 3;
    }
  }

  if ( gameMode == complete1)
  {
    if (key == ' ')
    {
      gameMode = level2;
      gameInit();
      startTimer.begin = millis();
      startTimer.duration = 50;
      score = 0;
      lives = 2;
      levels();
    }
  }
}