/**
* @author luyujie
* @date 2017/10/19
* @description 住所マスタトリガーハンドラクラスです。
*  住所マスタから社員マスタの住所コードにより、住所情報を自動設定します。
*/
    public with sharing class AddressMasterHandler extends TriggerHandler {
    // トリガーの有効化判定フラグ
    public static Boolean TriggerDisabled = false;

    /**
    * @description トリガーの有効化判定処理。
    */
    public override Boolean IsDisabled(){
        return TriggerDisabled;
    }

    /**
    * @description after update トリガーのハンドラ処理。
    * @param oldMap 更新前対象データ。
    * @param newMap 更新後対象データ。
    */
    public override void AfterUpdate(Map<Id, SObject> oldMap, Map<Id, SObject> newMap) {
        // 対象データを取得する
        List<AddressMaster__c> AddressMasterList = (List<AddressMaster__c>)newMap.values();

        //社員マスタ更新リスト
        List<Employee__c> updateList = new List<Employee__c>();

        // 更新データの住所コードを取得する
        Set<String> addressCDSet = new Set<String>();
        for (AddressMaster__c item : AddressMasterList){
            If (!String.IsBlank(item.NAME)) {
                addressCDSet.add(item.NAME);
            }
        }

        // 社員マスタから住所情報を取得する
        List<Employee__c> employeeList = [select id, AddressCD__c,Address1__c from Employee__c where AddressCD__c IN :addressCDSet]; 

        // 住所コードマップ作成(マップ＜住所コード,住所詳細＞)
        Map<String, String> mapAddress = new Map<String, String>();
        for (AddressMaster__c item : addressMasterList) {
            mapAddress.put(item.NAME, item.Address__c);
        }

        // 社員マスタの住所１を設定する
        for (Employee__c item : employeeList){
            if (!String.IsBlank(item.AddressCD__c) && mapAddress.containsKey(item.AddressCD__c)) {
                item.Address1__c = mapAddress.get(item.AddressCD__c);
                updateList.add(item);
            }
        }
        // 社員マスタの更新を行う。
        if(updateList != null && !updateList.isEmpty()) {
            Database.update(updateList);
        }

        // アドレス設定
        //addressSetting(AddressMasterList);
    }
 }