public with sharing class PractiseOn_Loops {
  //Use of if-else and For loop
    public static void leftTriangleStarPattern() {
        for(Integer i=1;i<=5;i++)
        {
        String a = ' ';
        for(Integer j=1;j<=5;j++)
        {
        if(j>=6-i)
        {
          a = a + '*';
        }
        else
        {
          a = a + '_';
        }
        }
          system.debug(a);
        }
    }

    public static void downwardTriangleStarPattern() {
        for(Integer i=1;i<=5;i++)
        {
        String a = ' ';
        for(Integer j=1;j<=5;j++)
        {
        if(j<=6-i)
        {
            a = a + '*';
        }
        else
        {
            a = a + '_';
        }
        }
        system.debug(a);
        }
    }

    //Use of Do-While loop
    public static void useOfDoWhileLoop() {
      Integer i = 1;
      do
      {
        system.debug(i);
        i++;
      }
      while(i<20);
    }

    //Use of While loop 
    public static void useOfWhileLoop() {
      Integer num = 1;
      while(num < 11)
      {
        system.debug(num);
        num++;
      }
    }
  }