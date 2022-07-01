public with sharing class CallByValueAndReference {
    public CallByValueAndReference() {
        Integer i = 12;
        Integer j = 13;
        sumI(i,j);
        system.debug('Value of i Outside the Funcion : ' + i);
    }
    public void sumI(Integer i,Integer j) {
        i = i+j;
        system.debug('Value of i in Function : ' + i);
    }

    public static void creatingList() {
        List<String> stringList = new List<String>{'Anuradha','Leena','Nidhi'};
        system.debug(stringList);
        CallByReference(stringList);
        system.debug(stringList);
    }
    public static void callByReference(List<String> listName) {
    listName[0] = 'Anushree';
}
}