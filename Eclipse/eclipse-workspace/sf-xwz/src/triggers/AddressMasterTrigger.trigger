trigger AddressMasterTrigger on AddressMaster__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    TriggerDispatcher.executeHandler(new AddressMasterHandler());
}