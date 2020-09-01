//-----------------------------------------------------------Class-----------------------------------------------------------------------------------------------------
class Timer
{
  int Time;
  int begin;
  int duration;

//-----------------------------------------------------------Timer setup-----------------------------------------------------------------------------------------------
  Timer(int set)
  {
    Time = set;
    begin = millis();
  }

  int getTime()
  {
    return(Time);
  }

  void setTime (int set)
  {
    Time = set;
  }

  void countDown()
  {
    Time-= 1/frameRate;
  }
  

//-----------------------------------------------------------If statement when timer <0--------------------------------------------------------------------------------
  void timer0()
  {
    if (Time > 0) {  
      Time = duration - (millis() - begin)/1000;
    } else
    {
      gameMode = FINISH;
    }
    if ( Time <= 0)
    {
      gameMode = gameOver;
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
      image(gameOverImg, 0, 0);
    }
  }
}