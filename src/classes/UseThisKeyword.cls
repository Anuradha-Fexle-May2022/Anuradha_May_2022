public with sharing class UseThisKeyword {
    public Integer mobileNumber;
    public UseThisKeyword(Integer mobileNumber) {
        this.mobileNumber = mobileNumber;
    }
    public void display() {
        system.debug('My mobileNumber is' + mobileNumber);
    }
}