public with sharing class InsertAndUpdateRecords {
    public InsertAndUpdateRecords() {
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<3;i++) {
            Account a = new Account(Name='Acme' + i, BillingCity='San Francisco');         //Insert records
            accts.add(a);
        }
        Account accountToUpdate;
        try
        {
            insert accts;        
            
            // Update account 
            accountToUpdate = [SELECT BillingCity FROM Account WHERE Name= 'Acme2' AND BillingCity = 'San Francisco' LIMIT 1];

            // Update the billing city
            accountToUpdate.BillingCity = 'New York';
            update accountToUpdate;
        } 
        catch(DmlException e) 
        {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        
        // Verify that the billing city was updated to New York
        Account afterUpdate = [SELECT BillingCity FROM Account WHERE Id = :accountToUpdate.Id];
        System.assertEquals('New York', afterUpdate.BillingCity);
    }

    public static void insertRecords() {
        try 
        {
            Account acct = new Account(Name = 'SFDC Account');
            insert acct;

            ID acctID = acct.ID;
        
            // Add a contact to this account
            Contact con = new Contact(FirstName = 'Joe',LastName = 'Smith',Phone = '415.555.1212',AccountId = acctID);
            insert con;
        } 
        catch(DmlException e) 
        {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }

    public static void updateRecords() {
        try 
        {
            Contact queriedContact = [SELECT Account.Name FROM Contact WHERE FirstName = 'Joe' AND LastName = 'Smith' LIMIT 1];
        
            // Update the contacts phone number
            queriedContact.Phone = '415.555.1213';
        
            // Update the related account industry
            queriedContact.Account.Industry = 'Technology';
     
            // update the contacts phone number
            update queriedContact;
            
            // update the related accounts Industry field.
            update queriedContact.Account; 
        } 
        catch(Exception e) 
        {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}