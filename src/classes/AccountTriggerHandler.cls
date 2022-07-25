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
                    if(acc.Account_Details__c == 'Fixed Account'){
                        acc.AccountNumber = 'FA-' + acc.AccountNumber;
                    }
                }
            }
        }
        catch (DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    //Create a method for afterInsert Event
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
                    String body = 'Dear, ' + acc.Name + '<br>' + ' Welcome to Axis Bank ' + '<br>' + 'Your Account Has Been Updated' + 'Your Account Number is' + acc.AccountNumber + '<br>' + 'If you have any query feel free to ask on 18006780067' + '<br>' +'Thanking You';
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
}