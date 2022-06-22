public with sharing class PatternPrintingOfLeftTriangle 
{
    public static void leftTrianglePattern()
     {
        Integer k=6;
        for(Integer i=1;i<=9;i++)
        { 
          if(i<=5){k--;}
          else{k++;}
          String a = ' '; 
          for(Integer j=1;j<=5;j++)
          { 
           if(j>=k)
            {
                a = a + '*';
            }
             else
             {
                a = a + '#';
             }  
          }
            system.debug(a);
         }  
        }

    public static void downTrianglePattern(){
      for(Integer i=1;i<=5;i++)
      {
       String a = ' ';
      for(Integer j=1;j<=9;j++)
       {
        if(i==1)  //Only for first line//
        {
          a = a + '*';
        }
        else
        {
        if(j==i||j==11-i-1)
        {
          a = a + '*';
        }
        else
        {
          a = a + '_';
        }
       }
      }
       system.debug(a);
      }
    }
  }