//Make a class and their different methods using different events
public with sharing class AccountTriggerHandler {
    //Create a method for beforeInsert Event and use condition for Saving account and Fixed account
    public static void insertAccountDetails(List<Account> newList){
        try{
            if(newList.size() > 0)
            {
                for(Account acc : newList){
                    if(acc.Account_Details__c == 'Saving Account'){
                        acc.AccountNumber = 'SA-' + acc.AccountNumber;
                    }
                    else if(acc.Account_Details__c == 'Fixed Account'){
                        acc.AccountNumber = 'FA-' + acc.AccountNumber;
                    }
                }
            }
            system.debug('newList : ' + newList);
        }
        catch (DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    //Creating a Email with Confirmation of Account Number and type
    public static void sendingEmails(List<Account> newList){
        try{
            //Create a master list to hold the emails we will send
            List<Messaging.SingleEmailMessage > listOfEmail = new List<Messaging.SingleEmailMessage >();
            for(Account acc : newList)
            {
                //Create a new Email
                Messaging.SingleEmailMessage  email = new Messaging.SingleEmailMessage (); 
                List<String> toAddress = new List<String>{acc.Email_Address__c};
                if(toAddress.size() > 0)
                {
                    email.setToAddresses(toAddress);
                    email.setSubject('Congratulation :' + acc.Name);
                    String body = 'Dear, ' + acc.Name + '<br>' + ' Welcome to Axis Bank ' + '<br>' + 'Your Account Has Been Updated ' + ' Your Account Number is ' + acc.AccountNumber + '<br>' + 'If you have any query feel free to ask on 18006780067' + '<br>' +'Thanking You';
                    email.setHtmlBody(body);
                    //Add email to the master list
                    listOfEmail.add(email);
                }
            }
            //Send all emails in the master list
            if(listOfEmail.size() > 0)
            {
                Messaging.sendEmail(listOfEmail);
            }
        }
        catch(DmlException e) 
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }

    //Try Examples
    //If Account Industry is not null and having value as 'Media' then populate Rating as 'Hot' otherwise 'cold'
    public static void rating(List<Account> newList){
        try{
        for(Account acc : newList){
            if(acc.Industry != null && acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
            else{
                acc.Rating = 'Cold';
            }
        }
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    //When account record is created opportunity will be created and updated
    public static void createdRelatedOpp(List<Account> newList){
        try{
        List<Opportunity> oppToBeInserted = new List<Opportunity>();
        //Created Related Opportunity when Account is created
        for(Account acc : newList){
            //This instance is used to store the opportunity record
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            oppToBeInserted.add(opp);
        }
        //Using insert DML opertaion and checking that the list is null
        if(!oppToBeInserted.isEmpty()){
            insert oppToBeInserted;
        }
    }
    catch(DmlException e)
    {
        system.debug('An unexpected error has occurred: ' + e.getMessage());
    }
    }
    
    //If Account Phone is updated then put update message in description
    public static void updatePhoneDescription(List<Account> newList, Map<Id,Account> oldMap){
        try{
        for(Account acc : newList){
            //Check the condition of oldMap and account phone
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone){
                acc.Description = 'Phone is modified on Account';
            }
        }
    }
    catch(DmlException e)
    {
        system.debug('An unexpected error has occurred: ' + e.getMessage());
    }
    }
    //If Account phone is updated then populate that on all related opportunities
    public static void updateRelatedOppPhone(List<Account> newList, Map<Id,Account> oldMap){
        try{
        Map<Id, Account> accIdToAccountMap = new  Map<Id, Account>();
        List<Opportunity> oppToBeUpdated = new List<Opportunity>();
        for(Account acc : newList){
            //Check the condition of oldMap and account phone
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone){
                //This map will be having account id and account record where phone field is modified and their all information are having in map
                accIdToAccountMap.put(acc.id,acc);
            }
        }
        //Using SOQL query in this all the opportunity records will be queried where account id is in the keyset
        if(accIdToAccountMap != null){
        for(Opportunity opp : [SELECT Id, Account_Phone__c, AccountId FROM Opportunity WHERE AccountId IN : accIdToAccountMap.keyset()]){
            //Through this opportunitity we can fetch account id 
            Opportunity oppor = new Opportunity();
            if(accIdToAccountMap.containsKey(opp.AccountId)){
                oppor.id = opp.id;
                //We can just find phone record and the record is saved already for that we make a custom field of phone on opportunity
                oppor.Account_Phone__c = accIdToAccountMap.get(opp.AccountId).Phone;
                oppToBeUpdated.add(oppor);
            }
        }
        }
        //Check the condition if oppToBeUpdated(List) is not empty then we can apply Update DML operation
        if(!oppToBeUpdated.isEmpty()){
            update oppToBeUpdated;
        }
    }
    catch(DmlException e)
    {
        system.debug('An unexpected error has occurred: ' + e.getMessage());
    }
    }

    //Prevent account deletion if the account is active
    public static void checkStatus(List<Account> oldList) {
        try{
            for(Account acc : oldList){
                if(acc.Active__c == True){
                    acc.addError('Active Account cannot be removed');
                }
            }
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }

    //When account is deleted, delete the associated opportunity record
    public static void  deleteRelatedOpps(Map<Id,Account> mapIdAccount){
        try{
            if(mapIdAccount.size() > 0){
                List<Opportunity> oppsToBeDeleted = new List<Opportunity>();
                for(Opportunity opp : [SELECT Id FROM Opportunity WHERE AccountId IN : mapIdAccount.keySet()]){
                    oppsToBeDeleted.add(opp);
                }
                if(!oppsToBeDeleted.isEmpty()){
                    delete oppsToBeDeleted;
                }
            }
        }
        catch(DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}