public with sharing class PractiseOnPrimitiveDataTypes {
    //Primitive Data Type Examples
    public static void booleanMethod() {
        Boolean b = Boolean.ValueOf(True);
        system.debug(b);
    }

    public static void doubleMethod() {
        Double d = 3.14165;
        system.debug(d);
    }

    public static void idMethod() {
        Id i = '00300003T2PGAA0';
        system.debug(i);
    }

    public static void integerExample() {
        Integer i = 1;
        system.debug(i);
    }

    public static void stringMethod() {
        String s = 'Hello India';
        system.debug(s);
    }

    public static void longExample() {
        Long l = 1253467L;
        system.debug(l);
    }

    public static void objectExample() {
        Object obj = 10;
        Integer i = (Integer)obj;                               //Cast the Obj to Integer
        system.debug(i);                               
    }

    //Methods Examples
    //Date Class Example

    public static void addDaysExample() {
        Date myDate = Date.newInstance(1960, 2, 12);
        Date newDate = mydate.addDays(2);                                 
        system.debug(newDate);
    }

    public static void addMonthsExample() {
        Date myDate = date.newInstance(2010,03,08);
        Date newDate = mydate.addMonths(3);           
        system.debug(newDate);
    }

    public static void addYearsExample() {
        Date myDate = date.newInstance(2018,02,28);
        Date newDate = myDate.addYears(4);           
        system.debug(newDate);
    }

    public static void dayExample() {
        Date myDate = date.newInstance(2010,04,12);
        Integer day = myDate.day();                 
        system.debug(day);
    }

    public static void dayOfYearExample() {
        Date myDate = date.newInstance(2018,01,15);
        Integer day = myDate.dayOfYear();             
        system.debug(day);
    }

    public static void todayExample() {
        Date myDate = Date.today();
        system.debug(myDate);
    }

    //DateTime Examples

    public static void addDateTimeDaysExample() {
        DateTime myDateTime = DateTime.newInstance(1972,05,27,5,4,2);
        DateTime newDateTime = mydateTime.addDays(2);
        system.debug(newDateTime);
    }

    public static void addDateTimeHours() {
        DateTime myDateTime = DateTime.newInstance(1960,09,15,4,6,9);
        DateTime newDateTime = mydateTime.addHours(2);
        system.debug(newDateTime);
    }

    public static void addDateTimeMinutes() {
        DateTime myDateTime = DateTime.newInstance(2010,07,26,4,1,9);
        DateTime newDateTime = mydateTime.addMinutes(5);
        system.debug(newDateTime);
    }

    public static void addDateTimeMonths() {
        DateTime myDateTime = DateTime.newInstance(2000,06,10,3,8,6);
        DateTime newDateTime = mydateTime.addMonths(5);
        system.debug(newDateTime);
    }

    //String Examples

    public static void capitalizeExample() {
        String name = 'hello india';
        String name1 = name.Capitalize();
        system.debug(name1);
    }

    public static void lowerCaseExample() {
        String allLower = 'anu';
        system.debug(allLower);
    }

    public static void upperCaseExample() {
        String allUpper = 'ANU';
        system.debug(allUpper);
    }

    public static void lengthExample() {
        String myString = 'anu';
        Integer result = myString.Length();
        system.debug(result);
    }

    //Collection Examples
    //List Examples

    public static void listExample(){
        List<String> fruits = new List<String>{'Apple','Banana','Orange'};
        fruits.add('Mango');
        fruits.add('Papaya');                                 
        system.debug(fruits);
    }

    public static void declareIndexInList(){
        List<String> fruits = new List<String>(4);
        fruits.add(2,'Mango');                               
        fruits.add(0,'Apple');                                //Acc to index 
        system.debug(fruits);
    }

    public static void nestedListExample() {
        List<String> mylist = new List<String>();
        List<List<Set<Integer>>> mylist2 = new List<List<Set<Integer>>>();    //Nested list
        system.debug(mylist2);
    }

    public static void setExample(){
        Set<String> compassSet = new Set<String>{'East','North'};
        compassSet.add('West');
        compassSet.add('South');                              
        system.debug(compassSet);      
    }

    public static void setMethod() {
        Set<Integer> mySet = new Set<Integer>();
        mySet.add(1);
        mySet.add(3);
        system.debug(mySet);
        mySet.Remove(1);                            //Remove the Integer value from the Set
    }

    public static void mapExample() {
        Map<String,String> name = new Map<String,String>();
        name.put('Anu','Nidhi');
        name.put('Soumi','Leena');
        system.debug(name);
    }

    public static void mapMethod() {
        Map<String,Integer> employeeByAccName = new Map<String,Integer>();
        employeeByAccName.put('Anu',1000);
        employeeByAccName.put('Nidhi',2000);
        system.debug(employeeByAccName);
    }
}