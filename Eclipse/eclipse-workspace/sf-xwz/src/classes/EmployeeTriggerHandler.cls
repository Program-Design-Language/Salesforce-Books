/**
 * @author xu wenzhen
 * @date 2017/10/10
 * @description XXXXトリガーハンドラクラスです。
 *   住所コードにより、住所マスタから住所情報を自動設定します。
 */
public with sharing class EmployeeTriggerHandler extends TriggerHandler {
    // トリガーの有効化判定フラグ
    public static Boolean TriggerDisabled = false;

    /**
     * @description トリガーの有効化判定処理。
     */
    public override Boolean IsDisabled(){
        return TriggerDisabled;
    }

    /**
     * @description before insert トリガーのハンドラ処理。
     * @param newList 対象データ。
     */
    public override void BeforeInsert(List<SObject> newList) {
        // 対象データを取得する
        List<Employee__c> employeeList = (List<Employee__c>)newList;
        
        // アドレス設定
        addressSetting(employeeList);
    }

    /**
     * @description before update トリガーのハンドラ処理。
     * @param oldMap 更新前対象データ。
     * @param newMap 更新後対象データ。
     */
    public override void BeforeUpdate(Map<Id, SObject> oldMap, Map<Id, SObject> newMap) {
        // 対象データを取得する
        List<Employee__c> employeeList = (List<Employee__c>)newMap.values();
        
        // アドレス設定
        addressSetting(employeeList);
    }
    
    /**
     * @description before update 住所からからアドレスを自動補足処理。
     * @param List<Employee__c> 対象データ
     */
    private void addressSetting(List<Employee__c> employeeList) {
        // 関連の住所コードを取得する
        Set<String> addressCDSet = new Set<String>();
        for (Employee__c item : employeeList){
            If (!String.IsBlank(item.AddressCD__c)) {
                addressCDSet.add(item.AddressCD__c);
            }
        }
        
        // 住所マスタから住所情報を取得する
        List<AddressMaster__c> addressMasterList = [select id,Name, Address__c from AddressMaster__c where Name IN :addressCDSet]; 
        system.debug(addressMasterList);

        // 住所コードマップ作成(マップ＜住所コード,住所詳細＞)
        Map<String, String> mapAddress = new Map<String, String>();
        for (AddressMaster__c item : addressMasterList) {
            mapAddress.put(item.name, item.Address__c);
        }

        // 社員マスタの住所１を設定する
        for (Employee__c item : employeeList){
            if (!String.IsBlank(item.AddressCD__c)) {
                if (mapAddress.containsKey(item.AddressCD__c)) {
                    item.Address1__c = mapAddress.get(item.AddressCD__c);
                } else {
                    item.Address1__c.adderror('関連の住所コードが存在しません。');
              
                }
            }
        }
    }
}