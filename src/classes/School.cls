//Use Overriding Method
public virtual class School {
    String sName;
    public School() {
        sName = 'notDefined';
    }
    public School(String name) {
        sName = name;
    }
    public virtual void displayDetails() {
        system.debug('School name : ' + sName);
    }
}