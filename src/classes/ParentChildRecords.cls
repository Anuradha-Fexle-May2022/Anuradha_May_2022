public with sharing class ParentChildRecords {
    public ParentChildRecords() {
        try
        {
        Date dt = Date.today();
        dt = dt.addDays(7);
        Opportunity newOpportunity = new Opportunity(Name = 'OpportunityWithAccountInsert',StageName = 'Prospecting',CloseDate = dt);
        
        // Create the parent reference
        Account accountReference = new Account(MyExtID__c = 'SAP111111');                
        newOpportunity.Account = accountReference;
        
        // Create the Account object to insert
        Account parentAccount = new Account(Name = 'Hallie',MyExtID__c = 'SAP111111');      
        
        // Create the account and the opportunity
        Database.SaveResult[] results = Database.insert(new sObject[] {parentAccount, newOpportunity});
        
        // Check results
        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) 
            {
            System.debug('Successfully created ID: ' + results[i].getId());
            } 
            else 
            {
            System.debug('Error: could not create sobject ' + 'for array element ' + i + '.');
            System.debug('The error reported was: ' + results[i].getErrors()[0].getMessage() + '\n');
            }
        }
    }
    catch(Exception e)
    {
        system.debug('An unexpected error has occurred: ' + e.getMessage());
    }
    }
}