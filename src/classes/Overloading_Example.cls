public with sharing class Overloading_Example {
    public static void displayDetails(String name) {
        system.debug('Name : ' + name);
    }
    public static void displayDetails(String name,Integer rollNumber) {
        system.debug('Name : ' + name);
        system.debug('RollNumber : ' + rollNumber);
    }
}