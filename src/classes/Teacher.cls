//Use Overriding Method
public with sharing class Teacher extends School {
    String sName;
    String tName;
    public Teacher() {
        super();
        tName = 'notDefined';
    }
    public Teacher(String schoolName,String teacherName) {
        super(schoolName);
        tName = teacherName;
    }
    public override void displayDetails() {
        super.displayDetails();
        system.debug('Teacher name : ' + tName);
    }
}