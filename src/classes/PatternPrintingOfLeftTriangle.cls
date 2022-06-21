public with sharing class PatternPrintingOfLeftTriangle {
    public static void leftTrianglePattern() {
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
    }