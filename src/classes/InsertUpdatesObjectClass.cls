public with sharing class InsertUpdatesObjectClass {
    public static void updateObjectClass() {
        Account acc = new Account();
        acc.Name = 'Radhika Malpani';
        acc.id = '0015i00000A7oAMAAZ';
        acc.Phone = '7976695057';
        acc.AccountNumber = '1563642834639';
        acc.Rating = '3.5';
        system.debug(acc);
        //insert acc;
        //Delete acc;
        update acc;
    }
}