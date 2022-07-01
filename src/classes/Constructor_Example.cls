public with sharing class Constructor_Example {
    public Constructor_Example() {
       system.debug('This is not Parameterised Constructor'); 
    }
    public Constructor_Example(String name) {
        system.debug('This is Parameterised Constructor' + name);
    }
}