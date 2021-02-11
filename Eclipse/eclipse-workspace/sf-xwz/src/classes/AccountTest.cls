@isTest
private class AccountTest {

    @isTest(seealldata=true) 
    static void testMethod3() {
       
       
        
        AddressMaster__c addressMaster = [select id, name, Address__c from AddressMaster__c where Name = '998004300'];
 
        update addressMaster;



    }

}