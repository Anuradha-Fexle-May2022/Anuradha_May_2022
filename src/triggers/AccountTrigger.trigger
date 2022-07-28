//Make a before insert, after insert, before update, after update event trigger 
trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete){
    //Here we are Performing Before trigger following events 
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.insertAccountDetails(Trigger.new);
            AccountTriggerHandler.rating(Trigger.new);
        }
        if(Trigger.isUpdate){
            AccountTriggerHandler.updatePhoneDescription(Trigger.new, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            AccountTriggerHandler.checkStatus(Trigger.Old);
        }
    }
    //Here we are Performing After trigger following events
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTriggerHandler.sendingEmails(Trigger.new);
            AccountTriggerHandler.createdRelatedOpp(Trigger.new);
        }
        if(Trigger.isUpdate){
            AccountTriggerHandler.updateRelatedOppPhone(Trigger.new, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            AccountTriggerHandler.deleteRelatedOpps(Trigger.oldMap);
        }
    }
}