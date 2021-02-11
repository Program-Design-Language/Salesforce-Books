public class TestClassSample {
/////** 
//// * @description 買取債権（TEMP）トリガー処理テストクラス
//// */
////@isTest
////private class BuyerCreditTempTriggerHandlerTest {
////    // 対象売り手企業名称
////    private static final String SUPPLIER_NAME = '株式会社１０ＸＸＸＸＸＸＸＸ';
////
////    // 対象買い手企業名称
////    private static final String BUYER_NAME = '株式会社２０ＸＸＸＸＸＸＸＸ';
////
////    // テスト実行ユーザ
////    private static User testUser = new User(Id = UserInfo.getUserId());
////
////    // 売り手企業
////    private static Account supplier;
////
////    // 買い手企業
////    private static Buyer__c buyer;
////
////    /** 
////    * @description セットアップ処理
////    */
////    @testSetup static void setup() {
////        // 売り手企業データ作成
////        createTestDataSupplier();
////
////        // 買い手企業データ作成
////        createTestDataBuyer();
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   異常：売り手企業が存在しない場合
////    */
////    @isTest static void testCase01() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp('1099999999', '2099999999', '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージ
////            System.assert(ApexPages.hasMessages());
////            for(ApexPages.Message message : ApexPages.getMessages()) {
////                System.assertEquals('存在しないサプライヤー法人コードが指定されています。', message.getSummary());
////            }
////
////            // （トリガ設定）支払サイト
////            System.assertEquals(null, buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(null, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(null, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals(null, buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(null, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(null, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   異常：買い手企業が存在しない場合
////    */
////    @isTest static void testCase02() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, '2099999999', '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージ
////            System.assert(ApexPages.hasMessages());
////            for(ApexPages.Message message : ApexPages.getMessages()) {
////                System.assertEquals('存在しないバイヤー法人コードが指定されています。', message.getSummary());
////            }
////
////            // （トリガ設定）支払サイト
////            System.assertEquals(null, buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(null, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(null, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals(null, buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(null, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(null, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   異常：手数料率マスタが登録されない場合
////    */
////    @isTest static void testCase03() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージ
////            System.assert(ApexPages.hasMessages());
////            for(ApexPages.Message message : ApexPages.getMessages()) {
////                System.assertEquals('有効な手数料率マスタが存在しません。', message.getSummary());
////            }
////
////            // （トリガ設定）支払サイト
////            System.assertEquals(null, buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(null, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(null, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals(null, buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(null, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(null, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   異常：手数料率マスタが登録しましたが、対象手数料率が存在しない場合
////    */
////    @isTest static void testCase04() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2010-12-31');
////            insert commissionRate;
////            
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージ
////            System.assert(ApexPages.hasMessages());
////            for(ApexPages.Message message : ApexPages.getMessages()) {
////                System.assertEquals('有効な手数料率マスタが存在しません。', message.getSummary());
////            }
////
////            // （トリガ設定）支払サイト
////            System.assertEquals(null, buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(null, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(null, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals(null, buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(null, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(null, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   正常：買取不可（査定拒絶）＝True
////    */
////    @isTest static void testCase05() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(true, true, true, true, '2017-10-11', true);
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // （トリガ設定）支払サイト
////            System.assertEquals('７営業日払い', buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(commissionRate.Id, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(buyer.Id, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals('1', buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(supplier.Id, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(supplier.TaxType__c, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   正常：買取不可（入金確認中）＝True
////    */
////    @isTest static void testCase06() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(false, true, true, true, '2017-10-11', true);
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // （トリガ設定）支払サイト
////            System.assertEquals('７営業日払い', buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(commissionRate.Id, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(buyer.Id, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals('2', buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(supplier.Id, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(supplier.TaxType__c, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   正常：買取不可（JPN委託）＝True
////    */
////    @isTest static void testCase07() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(false, false, true, true, '2017-10-11', true);
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // （トリガ設定）支払サイト
////            System.assertEquals('７営業日払い', buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(commissionRate.Id, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(buyer.Id, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals('3', buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(supplier.Id, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(supplier.TaxType__c, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   正常：買取不可（累積延滞）＝True
////    */
////    @isTest static void testCase08() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(false, false, false, true, '2017-10-11', true);
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // （トリガ設定）支払サイト
////            System.assertEquals('７営業日払い', buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(commissionRate.Id, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(buyer.Id, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals('4', buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(supplier.Id, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(supplier.TaxType__c, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   正常：売り手企業解約≠NULL
////    */
////    @isTest static void testCase09() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(false, false, false, false, '2017-10-11', true);
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // （トリガ設定）支払サイト
////            System.assertEquals('７営業日払い', buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(commissionRate.Id, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(buyer.Id, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals('5', buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(supplier.Id, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(supplier.TaxType__c, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   正常：デフォルトフラグ＝True
////    */
////    @isTest static void testCase10() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(false, false, false, false, null, true);
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // （トリガ設定）支払サイト
////            System.assertEquals('７営業日払い', buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(commissionRate.Id, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(buyer.Id, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals('6', buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(supplier.Id, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(supplier.TaxType__c, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   正常：買取可
////    */
////    @isTest static void testCase11() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(false, false, false, false, null, false);
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // （トリガ設定）支払サイト
////            System.assertEquals('７営業日払い', buyerCreditTemp.PaymentSite__c);
////
////            // （トリガ設定）手数料率
////            System.assertEquals(commissionRate.Id, buyerCreditTemp.CommissionRate__c);
////
////            // （トリガ設定）買い手企業
////            System.assertEquals(buyer.Id, buyerCreditTemp.Buyer__c);
////
////            // （トリガ設定）買取不可コード
////            System.assertEquals('0', buyerCreditTemp.NoPurchaseCode__c);
////
////            // （トリガ設定）売り手企業
////            System.assertEquals(supplier.Id, buyerCreditTemp.Supplier__c);
////
////            // （トリガ設定）税区分
////            System.assertEquals(supplier.TaxType__c, buyerCreditTemp.TaxType__c);
////        }
////    }
////
////    /** 
////    * @description Before Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeInsert
////    *   正常：複数件一括処理（201件）
////    */
////    @isTest static void testCase12() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(false, false, false, false, null, false);
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            for (Integer index = 0; index < 201; index++) {
////                BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////                buyerCreditTempList.add(buyerCreditTemp);
////            }
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateSupplierARCreate
////    *   正常：登録済みの買取債権（売り手締日別）が存在しない場合
////    */
////    @isTest static void testCase21() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp1 =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTemp1.PaymentSite__c = '７営業日払い';                                     // 支払サイト
////            buyerCreditTemp1.CreditClosing__c = '月末';                                           // 請求締め
////            buyerCreditTemp1.BillingYearMonth__c = '2017/10';                                   // 請求年月
////            buyerCreditTemp1.BillingDate__c = Date.valueOf('2017-12-01');                       // 請求日
////            buyerCreditTemp1.PlannedDepositDate__c = Date.valueOf('2017-12-31');                // 入金予定日
////            buyerCreditTemp1.PaymentDeadline__c = Date.valueOf('2018-12-31');                   // お支払期限
////            buyerCreditTempList.add(buyerCreditTemp1);
////
////            BuyerCreditTemp__c buyerCreditTemp2 =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTemp2.PaymentSite__c = '７営業日払い';                                     // 支払サイト
////            buyerCreditTemp2.CreditClosing__c = '月末';                                           // 請求締め
////            buyerCreditTemp2.BillingYearMonth__c = '2017/10';                                   // 請求年月
////            buyerCreditTemp2.BillingDate__c = Date.valueOf('2017-08-01');                       // 請求日
////            buyerCreditTemp2.PlannedDepositDate__c = Date.valueOf('2018-12-31');                // 入金予定日
////            buyerCreditTemp2.PaymentDeadline__c = Date.valueOf('2018-12-31');                   // お支払期限
////            buyerCreditTempList.add(buyerCreditTemp2);
////
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            insert buyerCreditTempList;
////
////            // 買取債権（売り手締日別）：データクリア
////            delete [select Id from SupplierAccountsReceivable__c];
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<SupplierAccountsReceivable__c> supplierAccountsReceivableList = service.createSupplierARCreate(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, supplierAccountsReceivableList.size());
////
////            SupplierAccountsReceivable__c result = supplierAccountsReceivableList.get(0);
////
////            // 新規作成
////            System.assertNotEquals(null, result.Id);
////
////            // 売り手企業
////            System.assertEquals(supplier.Id, result.Supplier__c);
////
////            // 支払サイト
////            System.assertEquals('７営業日払い', result.PaymentSite__c);
////
////            // 請求締め
////            System.assertEquals('月末', result.CreditClosing__c);
////
////            // 請求年月
////            System.assertEquals('2017/10', result.BillingYearMonth__c);
////
////            // 手数料率
////            System.assertEquals(buyerCreditTemp1.CommissionRate__c, result.CommissionRate__c);
////
////            // 請求締め日
////            System.assertEquals(buyerCreditTemp1.BillingDate__c, result.CreditClosingDate__c);
////
////            // 支払予定日
////            System.assertEquals(buyerCreditTemp2.PlannedDepositDate__c, result.PlannedDepositDate__c);
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateSupplierARCreate
////    *   正常：登録済みの買取債権（売り手締日別）が存在する場合
////    */
////    @isTest static void testCase22() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp1 =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTemp1.PaymentSite__c = '７営業日払い';                                     // 支払サイト
////            buyerCreditTemp1.CreditClosing__c = '月末';                                           // 請求締め
////            buyerCreditTemp1.BillingYearMonth__c = '2017/10';                                   // 請求年月
////            buyerCreditTemp1.BillingDate__c = Date.valueOf('2017-10-01');                       // 請求日
////            buyerCreditTemp1.PlannedDepositDate__c = Date.valueOf('2017-10-30');                // 入金予定日
////            buyerCreditTemp1.PaymentDeadline__c = Date.valueOf('2018-12-31');                   // お支払期限
////            buyerCreditTempList.add(buyerCreditTemp1);
////
////            BuyerCreditTemp__c buyerCreditTemp2 =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTemp2.PaymentSite__c = '７営業日払い';                                     // 支払サイト
////            buyerCreditTemp2.CreditClosing__c = '月末';                                           // 請求締め
////            buyerCreditTemp2.BillingYearMonth__c = '2017/12';                                   // 請求年月
////            buyerCreditTemp2.BillingDate__c = Date.valueOf('2017-12-01');                       // 請求日
////            buyerCreditTemp2.PlannedDepositDate__c = Date.valueOf('2017-12-31');                // 入金予定日
////            buyerCreditTemp2.PaymentDeadline__c = Date.valueOf('2018-12-31');                   // お支払期限
////            buyerCreditTempList.add(buyerCreditTemp2);
////
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            insert buyerCreditTempList;
////            // 買取債権（売り手締日別）：データクリア
////            delete [select Id from SupplierAccountsReceivable__c];
////
////            // 重複データ作成（買取債権（売り手締日別））
////            SupplierAccountsReceivable__c supplierAccountsReceivable = new SupplierAccountsReceivable__c();
////            supplierAccountsReceivable.Supplier__c = buyerCreditTemp1.Supplier__c;                  // 売り手企業
////            supplierAccountsReceivable.PaymentSite__c = buyerCreditTemp1.PaymentSite__c;            // 支払サイト
////            supplierAccountsReceivable.CreditClosing__c = buyerCreditTemp1.CreditClosing__c;        // 請求締め
////            supplierAccountsReceivable.BillingYearMonth__c = buyerCreditTemp1.BillingYearMonth__c;  // 請求年月
////            supplierAccountsReceivable.CommissionRate__c = buyerCreditTemp1.CommissionRate__c;      // 手数料率
////            supplierAccountsReceivable.CreditClosingDate__c = Date.valueOf('2017-11-01');           // 請求締め日(請求日)
////            supplierAccountsReceivable.PlannedDepositDate__c = Date.valueOf('2017-11-30');          // 支払予定日
////            insert supplierAccountsReceivable;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<SupplierAccountsReceivable__c> supplierAccountsReceivableList = service.createSupplierARCreate(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(2, supplierAccountsReceivableList.size());
////
////            for (SupplierAccountsReceivable__c result : supplierAccountsReceivableList) {
////                if (result.BillingYearMonth__c == '2017/10') {
////                    // 請求締め日(請求日)
////                    System.assertEquals(Date.valueOf('2017-11-01'), result.CreditClosingDate__c);
////                } else if (result.BillingYearMonth__c == '2017/12') {
////                    // 新規作成
////                    System.assertNotEquals(null, result.Id);
////
////                    // 売り手企業
////                    System.assertEquals(buyerCreditTemp2.Supplier__c, result.Supplier__c);
////
////                    // 支払サイト
////                    System.assertEquals(buyerCreditTemp2.PaymentSite__c, result.PaymentSite__c);
////
////                    // 請求締め
////                    System.assertEquals(buyerCreditTemp2.CreditClosing__c, result.CreditClosing__c);
////
////                    // 請求年月
////                    System.assertEquals(buyerCreditTemp2.BillingYearMonth__c, result.BillingYearMonth__c);
////
////                    // 手数料率
////                    System.assertEquals(buyerCreditTemp2.CommissionRate__c, result.CommissionRate__c);
////
////                    // 請求締め日
////                    System.assertEquals(buyerCreditTemp2.BillingDate__c, result.CreditClosingDate__c);
////
////                    // 支払予定日
////                    System.assertEquals(buyerCreditTemp2.PlannedDepositDate__c, result.PlannedDepositDate__c);
////                }
////            }
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditMonthly
////    *   正常：登録済みの買取債権（買い手月別）が存在しない場合
////    */
////    @isTest static void testCase31() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp1 =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTemp1.BillingYearMonth__c = '2017/10';                                   // 請求年月
////            buyerCreditTemp1.PaymentDeadline__c = Date.valueOf('2018-01-31');                   // お支払期限
////            buyerCreditTempList.add(buyerCreditTemp1);
////
////            BuyerCreditTemp__c buyerCreditTemp2 =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTemp2.BillingYearMonth__c = '2017/10';                                   // 請求年月
////            buyerCreditTemp2.PaymentDeadline__c = Date.valueOf('2018-12-31');                   // お支払期限
////            buyerCreditTempList.add(buyerCreditTemp2);
////
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            insert buyerCreditTempList;
////
////            // 買取債権（買い手月別）：データクリア
////            delete [select Id from BuyerCreditMonthly__c];
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditMonthly__c> buyerCreditMonthlyList = service.createBuyerCreditMonthly(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, buyerCreditMonthlyList.size());
////
////            BuyerCreditMonthly__c result = buyerCreditMonthlyList.get(0);
////
////            // 新規作成
////            System.assertNotEquals(null, result.Id);
////
////            // 買い手企業
////            System.assertEquals(buyer.Id, result.Buyer__c);
////
////            // 請求年月
////            System.assertEquals('2017/10', result.BillingYearMonth__c);
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditMonthly
////    *   正常：登録済みの買取債権（買い手月別）が存在する場合
////    */
////    @isTest static void testCase32() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp1 =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTemp1.BillingYearMonth__c = '2017/10';                                   // 請求年月
////            buyerCreditTemp1.PaymentDeadline__c = Date.valueOf('2018-12-31');                   // お支払期限
////            buyerCreditTempList.add(buyerCreditTemp1);
////
////            BuyerCreditTemp__c buyerCreditTemp2 =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTemp2.BillingYearMonth__c = '2017/12';                                   // 請求年月
////            buyerCreditTemp2.PaymentDeadline__c = Date.valueOf('2018-12-31');                   // お支払期限
////            buyerCreditTempList.add(buyerCreditTemp2);
////
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////            insert buyerCreditTempList;
////
////            // 買取債権（買い手月別）：データクリア
////            delete [select Id from BuyerCreditMonthly__c];
////
////            // 重複データ作成（買取債権（買い手月別））
////            BuyerCreditMonthly__c buyerCreditMonthly = new BuyerCreditMonthly__c();
////            buyerCreditMonthly.Buyer__c = buyerCreditTemp1.Buyer__c;                        // 買い手企業
////            buyerCreditMonthly.BillingYearMonth__c = buyerCreditTemp1.BillingYearMonth__c;  // 請求年月
////            insert buyerCreditMonthly;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditMonthly__c> buyerCreditMonthlyList = service.createBuyerCreditMonthly(buyerCreditTempList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(2, buyerCreditMonthlyList.size());
////
////            for (BuyerCreditMonthly__c result : buyerCreditMonthlyList) {
////                if (result.Id == buyerCreditMonthly.Id) {
////                    // 請求年月
////                    System.assertEquals(buyerCreditTemp1.BillingYearMonth__c, result.BillingYearMonth__c);
////                } else {
////                    // 新規作成
////                    System.assertNotEquals(null, result.Id);
////
////                    // 買い手企業
////                    System.assertEquals(buyer.Id, result.Buyer__c);
////
////                    // 請求年月
////                    System.assertEquals(buyerCreditTemp2.BillingYearMonth__c, result.BillingYearMonth__c);
////                }
////            }
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditDetails
////    *   正常：買取債権（明細）の作成
////    *       買取不可コード：'0'（買取可）
////    */
////    @isTest static void testCase40() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTempList.add(buyerCreditTemp);
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////
////            // 買取可
////            buyerCreditTemp.NoPurchaseCode__c = '0';
////
////            // 関連の買取債権（売り手締日別）をテストデータを作成する
////            List<SupplierAccountsReceivable__c> sarList = new List<SupplierAccountsReceivable__c>();
////            SupplierAccountsReceivable__c supplierAccountsReceivable = new SupplierAccountsReceivable__c();
////            supplierAccountsReceivable.Supplier__c = buyerCreditTemp.Supplier__c;
////            supplierAccountsReceivable.PaymentSite__c = buyerCreditTemp.PaymentSite__c;
////            supplierAccountsReceivable.CreditClosing__c = buyerCreditTemp.CreditClosing__c;
////            supplierAccountsReceivable.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////
////            supplierAccountsReceivable.CommissionRate__c = commissionRate.Id;
////            supplierAccountsReceivable.PlannedDepositDate__c = System.today().AddMonths(1);
////            supplierAccountsReceivable.CreditClosingDate__c = System.today();
////            sarList.add(supplierAccountsReceivable);
////            
////            system.debug(buyerCreditTemp);
////            system.debug(supplierAccountsReceivable);
////            
////            insert sarList;
////
////            // 関連の買取債権（買い手月別）をテストデータを作成する
////            List<BuyerCreditMonthly__c> bcmList = new List<BuyerCreditMonthly__c>();
////            BuyerCreditMonthly__c buyerCreditMonthly = new BuyerCreditMonthly__c();
////            buyerCreditMonthly.Buyer__c = buyerCreditTemp.Buyer__c;
////            buyerCreditMonthly.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////            bcmList.add(buyerCreditMonthly);
////            insert bcmList;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditDetails__c> buyerCreditDetailsList = service.createBuyerCreditDetails(buyerCreditTempList, sarList, bcmList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, buyerCreditDetailsList.size());
////
////            BuyerCreditDetails__c result = buyerCreditDetailsList.get(0);
////
////            // 売り手企業
////            System.assertEquals(buyerCreditTemp.Supplier__c, result.Supplier__c);
////
////            // 買い手企業
////            System.assertEquals(buyerCreditTemp.Buyer__c, result.Buyer__c);
////
////            // 品名
////            System.assertEquals(buyerCreditTemp.ItemName__c, result.ItemName__c);
////
////            // 単価
////            System.assertEquals(buyerCreditTemp.UnitPrice__c, result.UnitPrice__c);
////
////            // 数量
////            System.assertEquals(buyerCreditTemp.Quantity__c, result.Quantity__c);
////
////            // 単位
////            System.assertEquals(buyerCreditTemp.Unit__c, result.Unit__c);
////
////            // 請求日
////            System.assertEquals(buyerCreditTemp.BillingDate__c, result.BillingDate__c);
////
////            // 請求年月
////            System.assertEquals(buyerCreditTemp.BillingYearMonth__c, result.BillingYearMonth__c);
////
////            // 売上計上日
////            System.assertEquals(buyerCreditTemp.SalesDate__c, result.SalesDate__c);
////
////            // お支払期限
////            System.assertEquals(buyerCreditTemp.PaymentDeadline__c, result.PaymentDeadline__c);
////
////            // その他請求書記載事項
////            System.assertEquals(buyerCreditTemp.OtherInvoiceMatters__c, result.OtherInvoiceMatters__c);
////
////            // （請求書用）税区分
////            System.assertEquals(buyerCreditTemp.TaxType__c, result.TaxType__c);
////
////            // 買取債権（売り手締日別）の特定
////            System.assertEquals(supplierAccountsReceivable.Id, result.SupplierAccountsReceivable__c);
////
////            // 買取債権（買い手月別）の特定
////            System.assertEquals(buyerCreditMonthly.Id, result.BuyerCreditMonthly__c);
////
////            // 買取不可（査定拒絶）：'1'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseRejectionAssessmentFlag__c);
////
////            // 買取不可（入金確認中）：'2'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseConfirmPaymentFlag__c);
////
////            // 買取不可（JPN委託）：'3'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseJpnFlag__c);
////
////            // 買取不可（累積延滞）：'4'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCumulativeDelinquencyFlag__c);
////
////            // 買取不可（解約）：'5'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCancellation__c);
////
////            // 買取不可（債務不履行）：'6'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseDefault__c);
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditDetails
////    *   正常：買取債権（明細）の作成
////    *       買取不可コード：'1'（買取不可（査定拒絶））
////    */
////    @isTest static void testCase41() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTempList.add(buyerCreditTemp);
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////
////            // 買取可
////            buyerCreditTemp.NoPurchaseCode__c = '1';
////
////            // 関連の買取債権（売り手締日別）をテストデータを作成する
////            List<SupplierAccountsReceivable__c> sarList = new List<SupplierAccountsReceivable__c>();
////            SupplierAccountsReceivable__c supplierAccountsReceivable = new SupplierAccountsReceivable__c();
////            supplierAccountsReceivable.Supplier__c = buyerCreditTemp.Supplier__c;
////            supplierAccountsReceivable.PaymentSite__c = buyerCreditTemp.PaymentSite__c;
////            supplierAccountsReceivable.CreditClosing__c = buyerCreditTemp.CreditClosing__c;
////            supplierAccountsReceivable.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////
////            supplierAccountsReceivable.CommissionRate__c = commissionRate.Id;
////            supplierAccountsReceivable.PlannedDepositDate__c = System.today().AddMonths(1);
////            supplierAccountsReceivable.CreditClosingDate__c = System.today();
////            sarList.add(supplierAccountsReceivable);
////            
////            system.debug(buyerCreditTemp);
////            system.debug(supplierAccountsReceivable);
////            
////            insert sarList;
////
////            // 関連の買取債権（買い手月別）をテストデータを作成する
////            List<BuyerCreditMonthly__c> bcmList = new List<BuyerCreditMonthly__c>();
////            BuyerCreditMonthly__c buyerCreditMonthly = new BuyerCreditMonthly__c();
////            buyerCreditMonthly.Buyer__c = buyerCreditTemp.Buyer__c;
////            buyerCreditMonthly.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////            bcmList.add(buyerCreditMonthly);
////            insert bcmList;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditDetails__c> buyerCreditDetailsList = service.createBuyerCreditDetails(buyerCreditTempList, sarList, bcmList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, buyerCreditDetailsList.size());
////
////            BuyerCreditDetails__c result = buyerCreditDetailsList.get(0);
////
////            // 買取不可（査定拒絶）：'1'の場合、Ｔｒｕｅ
////            System.assertEquals(true, result.NoPurchaseRejectionAssessmentFlag__c);
////
////            // 買取不可（入金確認中）：'2'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseConfirmPaymentFlag__c);
////
////            // 買取不可（JPN委託）：'3'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseJpnFlag__c);
////
////            // 買取不可（累積延滞）：'4'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCumulativeDelinquencyFlag__c);
////
////            // 買取不可（解約）：'5'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCancellation__c);
////
////            // 買取不可（債務不履行）：'6'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseDefault__c);
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditDetails
////    *   正常：買取債権（明細）の作成
////    *       買取不可コード：'2'（買取不可（入金確認中））
////    */
////    @isTest static void testCase42() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTempList.add(buyerCreditTemp);
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////
////            // 買取可
////            buyerCreditTemp.NoPurchaseCode__c = '2';
////
////            // 関連の買取債権（売り手締日別）をテストデータを作成する
////            List<SupplierAccountsReceivable__c> sarList = new List<SupplierAccountsReceivable__c>();
////            SupplierAccountsReceivable__c supplierAccountsReceivable = new SupplierAccountsReceivable__c();
////            supplierAccountsReceivable.Supplier__c = buyerCreditTemp.Supplier__c;
////            supplierAccountsReceivable.PaymentSite__c = buyerCreditTemp.PaymentSite__c;
////            supplierAccountsReceivable.CreditClosing__c = buyerCreditTemp.CreditClosing__c;
////            supplierAccountsReceivable.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////
////            supplierAccountsReceivable.CommissionRate__c = commissionRate.Id;
////            supplierAccountsReceivable.PlannedDepositDate__c = System.today().AddMonths(1);
////            supplierAccountsReceivable.CreditClosingDate__c = System.today();
////            sarList.add(supplierAccountsReceivable);
////            
////            system.debug(buyerCreditTemp);
////            system.debug(supplierAccountsReceivable);
////            
////            insert sarList;
////
////            // 関連の買取債権（買い手月別）をテストデータを作成する
////            List<BuyerCreditMonthly__c> bcmList = new List<BuyerCreditMonthly__c>();
////            BuyerCreditMonthly__c buyerCreditMonthly = new BuyerCreditMonthly__c();
////            buyerCreditMonthly.Buyer__c = buyerCreditTemp.Buyer__c;
////            buyerCreditMonthly.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////            bcmList.add(buyerCreditMonthly);
////            insert bcmList;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditDetails__c> buyerCreditDetailsList = service.createBuyerCreditDetails(buyerCreditTempList, sarList, bcmList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, buyerCreditDetailsList.size());
////
////            BuyerCreditDetails__c result = buyerCreditDetailsList.get(0);
////
////            // 買取不可（査定拒絶）：'1'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseRejectionAssessmentFlag__c);
////
////            // 買取不可（入金確認中）：'2'の場合、Ｔｒｕｅ
////            System.assertEquals(true, result.NoPurchaseConfirmPaymentFlag__c);
////
////            // 買取不可（JPN委託）：'3'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseJpnFlag__c);
////
////            // 買取不可（累積延滞）：'4'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCumulativeDelinquencyFlag__c);
////
////            // 買取不可（解約）：'5'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCancellation__c);
////
////            // 買取不可（債務不履行）：'6'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseDefault__c);
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditDetails
////    *   正常：買取債権（明細）の作成
////    *       買取不可コード：'3'（買取不可（JPN委託））
////    */
////    @isTest static void testCase43() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTempList.add(buyerCreditTemp);
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////
////            // 買取可
////            buyerCreditTemp.NoPurchaseCode__c = '3';
////
////            // 関連の買取債権（売り手締日別）をテストデータを作成する
////            List<SupplierAccountsReceivable__c> sarList = new List<SupplierAccountsReceivable__c>();
////            SupplierAccountsReceivable__c supplierAccountsReceivable = new SupplierAccountsReceivable__c();
////            supplierAccountsReceivable.Supplier__c = buyerCreditTemp.Supplier__c;
////            supplierAccountsReceivable.PaymentSite__c = buyerCreditTemp.PaymentSite__c;
////            supplierAccountsReceivable.CreditClosing__c = buyerCreditTemp.CreditClosing__c;
////            supplierAccountsReceivable.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////
////            supplierAccountsReceivable.CommissionRate__c = commissionRate.Id;
////            supplierAccountsReceivable.PlannedDepositDate__c = System.today().AddMonths(1);
////            supplierAccountsReceivable.CreditClosingDate__c = System.today();
////            sarList.add(supplierAccountsReceivable);
////            
////            system.debug(buyerCreditTemp);
////            system.debug(supplierAccountsReceivable);
////            
////            insert sarList;
////
////            // 関連の買取債権（買い手月別）をテストデータを作成する
////            List<BuyerCreditMonthly__c> bcmList = new List<BuyerCreditMonthly__c>();
////            BuyerCreditMonthly__c buyerCreditMonthly = new BuyerCreditMonthly__c();
////            buyerCreditMonthly.Buyer__c = buyerCreditTemp.Buyer__c;
////            buyerCreditMonthly.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////            bcmList.add(buyerCreditMonthly);
////            insert bcmList;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditDetails__c> buyerCreditDetailsList = service.createBuyerCreditDetails(buyerCreditTempList, sarList, bcmList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, buyerCreditDetailsList.size());
////
////            BuyerCreditDetails__c result = buyerCreditDetailsList.get(0);
////
////            // 買取不可（査定拒絶）：'1'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseRejectionAssessmentFlag__c);
////
////            // 買取不可（入金確認中）：'2'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseConfirmPaymentFlag__c);
////
////            // 買取不可（JPN委託）：'3'の場合、Ｔｒｕｅ
////            System.assertEquals(true, result.NoPurchaseJpnFlag__c);
////
////            // 買取不可（累積延滞）：'4'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCumulativeDelinquencyFlag__c);
////
////            // 買取不可（解約）：'5'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCancellation__c);
////
////            // 買取不可（債務不履行）：'6'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseDefault__c);
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditDetails
////    *   正常：買取債権（明細）の作成
////    *       買取不可コード：'4'（買取不可（累積延滞））
////    */
////    @isTest static void testCase44() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTempList.add(buyerCreditTemp);
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////
////            // 買取可
////            buyerCreditTemp.NoPurchaseCode__c = '4';
////
////            // 関連の買取債権（売り手締日別）をテストデータを作成する
////            List<SupplierAccountsReceivable__c> sarList = new List<SupplierAccountsReceivable__c>();
////            SupplierAccountsReceivable__c supplierAccountsReceivable = new SupplierAccountsReceivable__c();
////            supplierAccountsReceivable.Supplier__c = buyerCreditTemp.Supplier__c;
////            supplierAccountsReceivable.PaymentSite__c = buyerCreditTemp.PaymentSite__c;
////            supplierAccountsReceivable.CreditClosing__c = buyerCreditTemp.CreditClosing__c;
////            supplierAccountsReceivable.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////
////            supplierAccountsReceivable.CommissionRate__c = commissionRate.Id;
////            supplierAccountsReceivable.PlannedDepositDate__c = System.today().AddMonths(1);
////            supplierAccountsReceivable.CreditClosingDate__c = System.today();
////            sarList.add(supplierAccountsReceivable);
////            
////            system.debug(buyerCreditTemp);
////            system.debug(supplierAccountsReceivable);
////            
////            insert sarList;
////
////            // 関連の買取債権（買い手月別）をテストデータを作成する
////            List<BuyerCreditMonthly__c> bcmList = new List<BuyerCreditMonthly__c>();
////            BuyerCreditMonthly__c buyerCreditMonthly = new BuyerCreditMonthly__c();
////            buyerCreditMonthly.Buyer__c = buyerCreditTemp.Buyer__c;
////            buyerCreditMonthly.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////            bcmList.add(buyerCreditMonthly);
////            insert bcmList;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditDetails__c> buyerCreditDetailsList = service.createBuyerCreditDetails(buyerCreditTempList, sarList, bcmList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, buyerCreditDetailsList.size());
////
////            BuyerCreditDetails__c result = buyerCreditDetailsList.get(0);
////
////            // 買取不可（査定拒絶）：'1'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseRejectionAssessmentFlag__c);
////
////            // 買取不可（入金確認中）：'2'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseConfirmPaymentFlag__c);
////
////            // 買取不可（JPN委託）：'3'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseJpnFlag__c);
////
////            // 買取不可（累積延滞）：'4'の場合、Ｔｒｕｅ
////            System.assertEquals(true, result.NoPurchaseCumulativeDelinquencyFlag__c);
////
////            // 買取不可（解約）：'5'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCancellation__c);
////
////            // 買取不可（債務不履行）：'6'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseDefault__c);
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditDetails
////    *   正常：買取債権（明細）の作成
////    *       買取不可コード：'5'（買取不可（解約））
////    */
////    @isTest static void testCase45() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTempList.add(buyerCreditTemp);
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////
////            // 買取可
////            buyerCreditTemp.NoPurchaseCode__c = '5';
////
////            // 関連の買取債権（売り手締日別）をテストデータを作成する
////            List<SupplierAccountsReceivable__c> sarList = new List<SupplierAccountsReceivable__c>();
////            SupplierAccountsReceivable__c supplierAccountsReceivable = new SupplierAccountsReceivable__c();
////            supplierAccountsReceivable.Supplier__c = buyerCreditTemp.Supplier__c;
////            supplierAccountsReceivable.PaymentSite__c = buyerCreditTemp.PaymentSite__c;
////            supplierAccountsReceivable.CreditClosing__c = buyerCreditTemp.CreditClosing__c;
////            supplierAccountsReceivable.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////
////            supplierAccountsReceivable.CommissionRate__c = commissionRate.Id;
////            supplierAccountsReceivable.PlannedDepositDate__c = System.today().AddMonths(1);
////            supplierAccountsReceivable.CreditClosingDate__c = System.today();
////            sarList.add(supplierAccountsReceivable);
////            
////            system.debug(buyerCreditTemp);
////            system.debug(supplierAccountsReceivable);
////            
////            insert sarList;
////
////            // 関連の買取債権（買い手月別）をテストデータを作成する
////            List<BuyerCreditMonthly__c> bcmList = new List<BuyerCreditMonthly__c>();
////            BuyerCreditMonthly__c buyerCreditMonthly = new BuyerCreditMonthly__c();
////            buyerCreditMonthly.Buyer__c = buyerCreditTemp.Buyer__c;
////            buyerCreditMonthly.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////            bcmList.add(buyerCreditMonthly);
////            insert bcmList;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditDetails__c> buyerCreditDetailsList = service.createBuyerCreditDetails(buyerCreditTempList, sarList, bcmList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, buyerCreditDetailsList.size());
////
////            BuyerCreditDetails__c result = buyerCreditDetailsList.get(0);
////
////            // 買取不可（査定拒絶）：'1'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseRejectionAssessmentFlag__c);
////
////            // 買取不可（入金確認中）：'2'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseConfirmPaymentFlag__c);
////
////            // 買取不可（JPN委託）：'3'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseJpnFlag__c);
////
////            // 買取不可（累積延滞）：'4'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCumulativeDelinquencyFlag__c);
////
////            // 買取不可（解約）：'5'の場合、Ｔｒｕｅ
////            System.assertEquals(true, result.NoPurchaseCancellation__c);
////
////            // 買取不可（債務不履行）：'6'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseDefault__c);
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditServiceのcreateBuyerCreditDetails
////    *   正常：買取債権（明細）の作成
////    *       買取不可コード：'6'（買取不可（債務不履行））
////    */
////    @isTest static void testCase46() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            buyerCreditTempList.add(buyerCreditTemp);
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeInsert(buyerCreditTempList);
////
////            // 買取可
////            buyerCreditTemp.NoPurchaseCode__c = '6';
////
////            // 関連の買取債権（売り手締日別）をテストデータを作成する
////            List<SupplierAccountsReceivable__c> sarList = new List<SupplierAccountsReceivable__c>();
////            SupplierAccountsReceivable__c supplierAccountsReceivable = new SupplierAccountsReceivable__c();
////            supplierAccountsReceivable.Supplier__c = buyerCreditTemp.Supplier__c;
////            supplierAccountsReceivable.PaymentSite__c = buyerCreditTemp.PaymentSite__c;
////            supplierAccountsReceivable.CreditClosing__c = buyerCreditTemp.CreditClosing__c;
////            supplierAccountsReceivable.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////
////            supplierAccountsReceivable.CommissionRate__c = commissionRate.Id;
////            supplierAccountsReceivable.PlannedDepositDate__c = System.today().AddMonths(1);
////            supplierAccountsReceivable.CreditClosingDate__c = System.today();
////            sarList.add(supplierAccountsReceivable);
////            
////            system.debug(buyerCreditTemp);
////            system.debug(supplierAccountsReceivable);
////            
////            insert sarList;
////
////            // 関連の買取債権（買い手月別）をテストデータを作成する
////            List<BuyerCreditMonthly__c> bcmList = new List<BuyerCreditMonthly__c>();
////            BuyerCreditMonthly__c buyerCreditMonthly = new BuyerCreditMonthly__c();
////            buyerCreditMonthly.Buyer__c = buyerCreditTemp.Buyer__c;
////            buyerCreditMonthly.BillingYearMonth__c = buyerCreditTemp.BillingYearMonth__c;
////            bcmList.add(buyerCreditMonthly);
////            insert bcmList;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditService service = new BuyerCreditService();
////            List<BuyerCreditDetails__c> buyerCreditDetailsList = service.createBuyerCreditDetails(buyerCreditTempList, sarList, bcmList);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assertEquals(false, ApexPages.hasMessages());
////
////            // 作成データ件数の確認
////            System.assertEquals(1, buyerCreditDetailsList.size());
////
////            BuyerCreditDetails__c result = buyerCreditDetailsList.get(0);
////
////            // 買取不可（査定拒絶）：'1'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseRejectionAssessmentFlag__c);
////
////            // 買取不可（入金確認中）：'2'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseConfirmPaymentFlag__c);
////
////            // 買取不可（JPN委託）：'3'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseJpnFlag__c);
////
////            // 買取不可（累積延滞）：'4'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCumulativeDelinquencyFlag__c);
////
////            // 買取不可（解約）：'5'の場合、Ｔｒｕｅ
////            System.assertEquals(false, result.NoPurchaseCancellation__c);
////
////            // 買取不可（債務不履行）：'6'の場合、Ｔｒｕｅ
////            System.assertEquals(true, result.NoPurchaseDefault__c);
////        }
////    }
////
////    /** 
////    * @description Before Update トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeUpdate
////    *   異常：更新不可
////    */
////    @isTest static void testCase50() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(true, true, true, true, '2017-10-11', true);
////
////            // 買取債権（TEMP）のテストデータ作成
////            BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            buyerCreditTempList.add(buyerCreditTemp);
////            insert buyerCreditTempList;
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            BuyerCreditTempTriggerHandler handler = new BuyerCreditTempTriggerHandler(null, null);
////            handler.onBeforeUpdate(null, null, buyerCreditTempList, null);
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // エラーメッセージが存在しないこと確認
////            System.assert(ApexPages.hasMessages());
////            for(ApexPages.Message message : ApexPages.getMessages()) {
////                System.assertEquals('データを修正することはできません。取込データに不備があった場合、データを消した後、再度データを取り込んでください。', message.getSummary());
////            }
////        }
////    }
////
////    /** 
////    * @description After Insert トリガー処理
////    *   対象メソッド：BuyerCreditTempTriggerHandlerのonBeforeBefore～onBeforeUpdate
////    *   正常：買取債権（TEMP）の一括登録（２０1件）
////    */
////    @isTest static void testCase99() {
////        System.runAs(testUser) {
////            // ======データ準備======
////            // 売り手企業
////            supplier = getTestDataSupplier();
////
////            // 買い手企業
////            buyer = getTestDataBuyer();
////
////            // 手数料率のテストデータ作成
////            CommissionRate__c commissionRate = getTestDataCommissionRate('2000-01-01', '2020-12-31');
////            insert commissionRate;
////
////            // 買取不可コードの条件設定
////            noPurchaseCodeConditionSetting(true, true, true, true, '2017-10-11', true);
////
////            // 買取債権（TEMP）のテストデータ作成
////            List<BuyerCreditTemp__c> buyerCreditTempList = new List<BuyerCreditTemp__c>();
////            for (Integer index = 0; index < 201; index++) {
////                BuyerCreditTemp__c buyerCreditTemp =  getTestDataBuyerCreditTemp(supplier.SupplierCorporationCode__c, buyer.BuyerCorporationCode__c, '2017-10-11');
////
////                // 請求年月のリセット(＋1ケ月)
////                buyerCreditTemp.BillingYearMonth__c = DateTime.now().addMonths(index).format('yyyy/MM');
////
////                buyerCreditTempList.add(buyerCreditTemp);
////            }
////
////            // ======処理を呼び出す======
////            Test.startTest();
////            insert buyerCreditTempList;
////            Test.stopTest();
////
////            // ======期待結果確認======
////            // 買取債権（売り手締日別）のデータ件数確認
////            Integer cnt1 = [select count() from SupplierAccountsReceivable__c];
////            System.assertEquals(201, cnt1);
////
////            // 買取債権（買い手月別）のデータ件数確認
////            Integer cnt2 = [select count() from BuyerCreditMonthly__c];
////            System.assertEquals(201, cnt2);
////
////            // 買取債権（明細）のデータ件数確認
////            Integer cnt3 = [select count() from BuyerCreditDetails__c];
////            System.assertEquals(201, cnt3);
////        }
////    }
////
////    /**====================================================================================
////     **   Test class utilites
////     **====================================================================================*/
////    /** 
////    * @description 売り手企業データ作成
////    */
////    private static void createTestDataSupplier(){
////        supplier = new Account();
////        // ======必須項目設定======
////        // 取引先名
////        supplier.Name = SUPPLIER_NAME;
////
////        // 代表電話番号
////        supplier.RepresentativeTel__c = '080-1234-5678';
////
////        // 税区分
////        supplier.TaxType__c = '内税';
////
////        // *代表者名（漢）
////        supplier.RepresentativeNameKanji__c = 'テストユーザ';
////
////        // 支払サイト
////        supplier.PaymentSite__c = '７営業日払い';
////
////        // 郵便番号
////        supplier.PostalCode__c = '333-1111';
////
////        // 住所１（ｶﾅ）
////        supplier.Address1Kana__c = 'ｱｲｳｴｵ';
////
////        // 住所２（ｶﾅ）
////        supplier.Address2Kana__c = 'ｱｲｳｴｵ';
////
////        // 住所１（漢）
////        supplier.Address1Kanji__c = '住所漢字';
////
////        // 住所２（漢）
////        supplier.Address2Kanji__c = '住所漢字';
////
////        // 法人名（ｶﾅ）
////        supplier.CorporationNameKana__c = 'ｱｲｳｴｵ';
////
////        // 法人口座名義（ｶﾅ）
////        supplier.CorporationAccountHolderKana__c = 'ｱｲｳｴｵ';
////
////        // 請求先郵便番号
////        supplier.BillingPostalCode__c = '333-1111';
////
////        // *代表者名（ｶﾅ）
////        supplier.RepresentativeNameKana__c = 'ｱｲｳｴｵ';
////
////        // 請求先住所１（漢）
////        supplier.BillingAddress1Kanji__c = 'ｱｲｳｴｵ';
////
////        // 請求先住所２（漢）
////        supplier.BillingAddress2Kanji__c = '請求先住所２';
////
////        // 請求先住所（ｶﾅ）
////        supplier.BillingAddressKana__c = 'ｱｲｳｴｵ';
////
////        // 請求先担当者氏名（ｶﾅ）
////        supplier.BillingContactNameKana__c = 'ｱｲｳｴｵ';
////
////        // 請求先担当者氏名（漢）
////        supplier.BillingContactNameKanji__c = '請求先担当者氏名';
////
////        // 請求先メールアドレス
////        supplier.BillingMail__c = 'test@terrasky.co.jp';
////
////        // 請求先都道府県
////        supplier.BillingPrefecture__c = '東京都';
////
////        // 請求先電話番号
////        supplier.BillingTel__c = '080-1234-5678';
////
////        // 新規作成
////        insert supplier;
////    }
////
////    /** 
////    * @description 売り手企業データ取得
////    */
////    private static Account getTestDataSupplier(){
////        // 売り手企業データ取得
////        Account supplier = [select SupplierCorporationCode__c, PaymentSite__c, TaxType__c from Account where Name =:SUPPLIER_NAME Limit 1];
////        return supplier;
////    }
////
////    /** 
////    * @description 手数料率データ作成
////    */
////    private static CommissionRate__c getTestDataCommissionRate(String strStartDate, String strEndDate){
////        CommissionRate__c commissionRate = new CommissionRate__c();
////        // ======必須項目設定======
////        // 売り手企業
////        commissionRate.Supplier__c = supplier.Id;
////
////        // 開始日
////        commissionRate.StartDate__c = Date.valueOf(strStartDate);
////
////        // 終了日
////        commissionRate.EndDate__c = Date.valueOf(strEndDate);
////
////        // 手数料率（7営業日・10日締）
////        commissionRate.CommissionRate07_10__c = 4;
////
////        // 手数料率（7営業日・20日締）
////        commissionRate.CommissionRate07_20__c = 3;
////
////        // 手数料率（7営業日・月末日締）
////        commissionRate.CommissionRate07_30__c = 2;
////
////        // 手数料率（40日後・月末日締）
////        commissionRate.CommissionRate40_30__c = 1;
////
////        // 対象インスタンスを返却する
////        return commissionRate;
////    }
////
////    /** 
////    * @description 買い手企業データ作成
////    */
////    private static void createTestDataBuyer(){
////        buyer = new Buyer__c();
////        // ======必須項目設定======
////        // 法人名（漢）
////        buyer.Name = BUYER_NAME;
////
////        // 法人名（ｶﾅ）
////        buyer.CorporationNameKana__c = 'カナ';
////
////        // 代表電話番号
////        buyer.RepresentativeTel__c = '080-1234-5678';
////
////        // 会社区分
////        buyer.CompanyType__c = '法人';
////
////        // 郵便番号
////        buyer.PostalCode__c = '333-1234';
////
////        // 都道府県
////        buyer.Prefecture__c = '北海道';
////
////        // 住所１（漢）
////        buyer.CorporationAddress1Kanji__c = '住所１（漢）';
////
////        // 住所２（漢）
////        buyer.CorporationAddress2Kanji__c = '住所２（漢）';
////
////        // *代表者名（漢）
////        buyer.RepresentativeNameKanji__c = '代表者名（漢）';
////
////        // 請求先担当者氏名（漢）
////        buyer.BillingContactNameKanji__c = '請求先担当者氏名（漢）';
////
////        // 請求先担当者氏名（ｶﾅ）
////        buyer.BillingContactNameKana__c = 'アイウエオ';
////
////        // 請求先電話番号
////        buyer.BillingTel__c = '080-1234-5679';
////
////        // 請求先メールアドレス
////        buyer.BillingMail__c = 'test@terrasky.co.jp';
////
////        // 請求先郵便番号
////        buyer.BillingPostalCode__c = '333-1111';
////
////        // 請求先都道府県
////        buyer.BillingPrefecture__c = '北海道';
////
////        // 請求先住所１（漢）
////        buyer.BillingAddress1Kanji__c = '請求先住所１（漢）';
////
////        // 請求先住所２（漢）
////        buyer.BillingAddress2Kanji__c = '請求先住所２（漢）';
////
////        // 請求先住所（ｶﾅ）
////        buyer.BillingAddressKana__c = 'ｱｲｳｴｵ';
////
////        // ④存在確認【手入力項目】
////        buyer.R04__c = '未判定';
////
////        // 法人名（ｶﾅ）
////        buyer.CorporationNameKana__c = 'ｱｲｳｴｵ';
////
////        // 請求先担当者氏名（ｶﾅ）
////        buyer.BillingContactNameKana__c = 'ｱｲｳｴｵ';
////
////        // 新規作成
////        insert buyer;
////    }
////
////    /** 
////    * @description 買い手企業データ取得
////    */
////    private static Buyer__c getTestDataBuyer() {
////        // 買い手企業データ取得
////        Buyer__c buyer = [select BuyerCorporationCode__c from Buyer__c where Name =:BUYER_NAME Limit 1];
////        return buyer;
////    }
////
////    /** 
////    * @description 買取不可コードの条件設定
////    */
////    private static void noPurchaseCodeConditionSetting(
////        Boolean noPurchaseRejectionAssessmentFlag,
////        Boolean noPurchaseConfirmPaymentFlag,
////        Boolean noPurchaseJpnFlag,
////        Boolean noPurchaseCumulativeDelinquencyFlag,
////        String strCancellationDate,
////        Boolean defaultFlag) {
////
////        // ======売り手企業の関連条件設定======
////        if (String.IsBlank(strCancellationDate)) {
////            supplier.CancellationDate__c = null;
////        } else {
////            supplier.CancellationDate__c = Date.valueOf(strCancellationDate);
////        }
////
////        // 売り手企業情報更新
////        update supplier;
////
////        // ======買い手企業の関連条件設定======
////        // 買取不可（査定拒絶）
////        if (noPurchaseRejectionAssessmentFlag) {
////            buyer.AssessmentResultApproval1__c = true;
////            buyer.AssessmentResultApproval2__c = true;
////            buyer.AssessmentResult__c = '拒絶';
////        } else {
////            buyer.AssessmentResultApproval1__c = false;
////            buyer.AssessmentResultApproval2__c = false;
////            buyer.AssessmentResult__c = null;
////        }
////
////        // デフォルトフラグ
////        if (defaultFlag) {
////            buyer.DefaultFlag__c = true;
////        } else {
////            buyer.DefaultFlag__c = false;
////        }
////
////        // 買い手企業情報更新
////        update buyer;
////
////        // ======請求書（買い手）の関連データ作成======
////        List<BuyerInvoice__c> buyerInvoiceList = new List<BuyerInvoice__c>();
////
////        // 買取不可（入金確認中）
////        if (noPurchaseConfirmPaymentFlag) {
////            BuyerInvoice__c buyerInvoice = getBuyerInvoiceTestData();
////            // 延滞フラグ
////            buyerInvoice.ArrearsFlag__c = true;
////            buyerInvoiceList.add(buyerInvoice);
////        }
////
////        // 買取不可（JPN委託）
////        if (noPurchaseJpnFlag) {
////            BuyerInvoice__c buyerInvoice = getBuyerInvoiceTestData();
////            // JPN督促フラグ
////            buyerInvoice.JPNDunningFlag__c = true;
////            buyerInvoiceList.add(buyerInvoice);
////        }
////
////        // 買取不可（累積延滞）
////        if (noPurchaseCumulativeDelinquencyFlag) {
////            for (Integer index = 0; index < 5; index++) {
////                BuyerInvoice__c buyerInvoice = getBuyerInvoiceTestData();
////                // 延滞履歴フラグ
////                buyerInvoice.ArrearsHistoryFlag__c = true;
////                buyerInvoiceList.add(buyerInvoice);
////            }
////        }
////
////        // 請求書（買い手）テストデータ作成
////        insert buyerInvoiceList;
////    }
////
////    /** 
////    * @description 買取債権（TEMP）データ取得
////    */
////    private static BuyerCreditTemp__c getTestDataBuyerCreditTemp(String strSupplierCode, String strBuyerCode, String strBillingDate){
////        BuyerCreditTemp__c buyerCreditTemp = new BuyerCreditTemp__c();
////        // ======必須項目設定======
////        // 売り手企業法人コード
////        buyerCreditTemp.SupplierCorporationCode__c = strSupplierCode;
////
////        // 買い手企業法人コード
////        buyerCreditTemp.BuyerCorporationCode__c = strBuyerCode;
////
////        // 請求年月
////        buyerCreditTemp.BillingYearMonth__c = DateTime.now().format('yyyy/MM');
////
////        // 請求日
////        buyerCreditTemp.BillingDate__c = Date.ValueOf(strBillingDate);
////
////        // お支払期限
////        buyerCreditTemp.PaymentDeadline__c = System.today().addMonths(1);
////
////        // 入金予定日
////        buyerCreditTemp.PlannedDepositDate__c = System.today();
////
////        // 品目
////        buyerCreditTemp.ItemName__c = '品目';
////
////        // 単価
////        buyerCreditTemp.UnitPrice__c = 1;
////
////        // 数量
////        buyerCreditTemp.Quantity__c = 1;
////
////        // 金額
////        buyerCreditTemp.Amount__c = 1;
////
////        // 請求締め
////        buyerCreditTemp.CreditClosing__c = '月末';
////
////        // 結果を返却する
////        return buyerCreditTemp;
////    }
////
////    /** 
////    * @description 請求書（買い手）データ取得
////    */
////    private static BuyerInvoice__c getBuyerInvoiceTestData() {
////        BuyerInvoice__c buyerInvoice = new BuyerInvoice__c();
////        // ======必須項目設定======
////        // 買い手企業
////        buyerInvoice.Buyer__c = buyer.Id;
////
////        // 売り手企業
////        buyerInvoice.Supplier__c = supplier.Id;
////
////        // 請求日
////        buyerInvoice.BillingDate__c = System.today();
////
////        // お支払期限
////        buyerInvoice.PaymentDeadline__c = System.today().addMonths(1);
////
////        // 小計
////        buyerInvoice.SubTotal__c = 1;
////        
////        // 結果を返却する
////        return buyerInvoice;
////    }
////}
}