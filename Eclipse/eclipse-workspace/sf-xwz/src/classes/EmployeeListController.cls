public with sharing class EmployeeListController {
    // 【ViewState確認用】
    private String v1 = '11';
        
    // 【ViewState確認用-transient】
    transient public String v2 = '22';
    
    // 【ViewState確認用-Static】
    public Static String v3 = '33';
    
    // 検索条件
    public SearchCondition condition{ get;set; }

    // 検索結果リスト
    public List<Employee__c> results { get;set; }

    /**
     * 初期化処理
     */
    public void init(){
        this.condition = new SearchCondition();
        this.results = new List<Employee__c>();
    }

    /**
     * クリアボタン処理
     */
    public PageReference clear(){
        init();
        return null;
    }

    /**
     * 検索ボタン処理
     */
    public PageReference search() {
        try {
            // 入力チェック
////            If (String.IsBlank(condition.shimeiKanji) && String.IsBlank(condition.obj.Position__c)) {
////                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '氏名（漢字）または役職のいずれかを入力してください。'));
////                return null;
////            }

            // 検索条件からSOQLを作成
            String strSoqlQuery = 'select Name, ShimeiKanji__c, ShimeiKatakana__c, NyusyaDate__c, Department__c, Position__c from Employee__c where CreatedDate != null ';

            // 氏名（漢字）
            String strShimeiKanji;
            If (!String.IsBlank(condition.shimeiKanji)) {
                strShimeiKanji = '%' + condition.shimeiKanji + '%';
                strSoqlQuery = strSoqlQuery + ' and ShimeiKanji__c like :strShimeiKanji';
            }

            // 役職
            String strPosition;
            If (!String.IsBlank(condition.obj.Position__c)) {
                strPosition = condition.obj.Position__c;
                strSoqlQuery = strSoqlQuery + 'and Position__c =:strPosition';
            }

            system.debug(strSoqlQuery);
            // 対象データを検索する
            this.results = database.query(strSoqlQuery);
            
            
            system.debug(this.results);
        } catch (Exception e){
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
        }
        return null;
    }

    /**
     * 検索条件を管理するクラス
     */ 
    public Class SearchCondition {
        public Employee__c obj {get;set;}
        public String shimeiKanji {get;set;}
        public SearchCondition() {
            this.obj = new Employee__c();
            this.shimeiKanji = '';
        }
    }
}