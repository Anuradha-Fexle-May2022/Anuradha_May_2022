public with sharing class PractiseOnOperators {
    //Use of Assignment Operator
    public static void assignmentOperatorExample() {
        Integer a,b;
        b = 2;
        a = b;
        system.debug(a);
    }

    //Use of Addition Assignment Operator
    public static void additionAssignmentOperator() {
        Integer a,b;
        a = 10;
        b = 20;
        a+=b;
        system.debug(a);
    }

    //Use of Subtraction Assignment Operator
    public static void subtractionAssignmentOperator() {
        Integer x,y;
        x = 20;
        y = 10;
        x-=y;
        system.debug(x);
    }

    //Use of Multiplication Assignment Operator
    public static void multiplicationAssignmentOperator() {
        Integer c,d;
        c = 6;
        d = 10;
        c*=d;
        system.debug(c);
    }

    //Use of Division Assignment Operator
    public static void divisionAssignmentOperator() {
        Integer x,y;
        x = 20;
        y = 5;
        x/=y;
        system.debug(x);
    }

    //Use of Ternary Assignment Operator
    public static void ternaryOperator() {
        Boolean isLeapYear = true;
        String msg = isLeapYear ? 'It is a Leap Year' : 'It is not a Leap Year';
        system.debug(msg);  
    }

    //Use of Less than Operator
    public static void lessThanOperator() 
    {
        Integer x,y;
        x = 6;
        y = 10;
        if(x<y)
        {
            system.debug('x is less than y');
        }
        else
        {
            system.debug('x is not less than y');
        }
    }

    //Use of Greater than Operator
    public static void greaterThanOperator() 
    {
        Integer a,b;
        a = 20;
        b = 5;
        if(a>b)
        {
            system.debug('a is greater than b');    
        }
        else 
        {
            system.debug('a is not greater than b');
        }
    }

    //Use of Less than or equal to operator
    public static void lessThanEqualToOperator()   
    {
        Integer a,b;
        a = 100;
        b = 500;
        if(a<=b)
        {
            system.debug('a is less than b');
        }
        else 
        {
            system.debug('a is not less than b');
        }
    }

    //Use of Greater than or equal to operator
    public static void greaterThanEqualToOperator()
    {
        Integer x,y;
        x = 500;
        y = 200;
        if(x>=y)
        {
            system.debug('x is greater than y');
        }
        else
        {
            system.debug('x is not greater than y');
        }
    }
    
    //Use of Increatment Operator
    public static void increatmentOperator() {
        Integer oldest,age;
        oldest = 44;
        age = ++oldest;
        system.debug(age);
    }

    //Use of Decrement Operator
    public static void decrementOperator() {
        Integer pen,price;
        pen = 20;
        price = --pen;
        system.debug(price);
    }

    //Use of And logical Operator
    public static void andLogicalOperator() {
        Boolean bothTrue = true && true;  
        Boolean bothFalse = false && false; 
        system.debug(bothTrue);
        system.debug(bothFalse); 
    }    

    //Use of Safe Navigation Operator
    public static void safeNavigationOperator() {
        Student_Record__c rec = [SELECT id, Name__c FROM Student_Record__c LIMIT 1];
        String name = rec?.Name__c;
        system.debug(name);
    }
}