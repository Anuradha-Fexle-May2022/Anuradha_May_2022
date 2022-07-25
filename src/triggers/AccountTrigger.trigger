//Make a before inser and after insert event trigger 
trigger AccountTrigger on Account (before insert,after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.insertAccountDetails(Trigger.new);
        }
        if(Trigger.isAfter){
            AccountTriggerHandler.sendingEmails(Trigger.new);
        }
    }
}