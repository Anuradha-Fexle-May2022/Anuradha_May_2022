public with sharing class InstanceOfExample {
    public static void instanceOfMethod() {

        sObject s = new Case();
         Case c = (Case)s;                     //This is write TypeCasting

         Customer a = (Customer)s;             //This is wrong TypeCasting

         if(s instanceOf Case)
         {
            Case x = (Case)s;
         }
         else if(s instanceOf Customer) 
         {
            Customer y = (Customer)s;
         }
    }
}