public class mfCloudConnect {
    private static String access_apikey = 'gmC3QDgxbJuI3fheq9RY7AncaKZ7g3x8';
    private static String endpointRoot = 'https://sandbox-api.mfkessai.co.jp/v1';
    public String responseBody{get; set;}

    /**
     * 取引リストを取得
     *    Http請求方式：GET
     *    URL:https://sandbox-api.mfkessai.co.jp/v1/transactions?page=1&per_page=20
     */
    public PageReference indexTransaction(){
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('GET');
        httpRequest.setTimeout(120000);
        httpRequest.setHeader('apikey', access_apikey);
        httpRequest.setEndpoint(endpointRoot + '/transactions?page=1&per_page=20');

        Http http = new Http();
        try {
              HTTPResponse res = http.send(httpRequest);
              this.responseBody = res.getBody();
              System.debug(res.getBody());
        } catch (Exception e){
            throw e;
        }
        return null;
    }

    /**
     * 取引を登録
     *    Http請求方式：POST
     *    URL:https://sandbox-api.mfkessai.co.jp/v1/transactions
     */
    public PageReference createTransaction(){
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('POST');
        httpRequest.setTimeout(120000);
        httpRequest.setHeader('apikey', access_apikey);
        httpRequest.setHeader('Content-Type', 'application/json');
        httpRequest.setHeader('Accept','application/json');
        httpRequest.setBody(this.getJsonData());
        httpRequest.setEndpoint(endpointRoot + '/transactions');

        Http http = new Http();
        try {
              HTTPResponse res = http.send(httpRequest);
              this.responseBody = res.getBody();
              System.debug(res.getBody());
        } catch (Exception e){
            throw e;
        }
        return null;
    }

    /**
     * 取引IDを指定して取得
     *    Http請求方式：GET
     *    URL:https://sandbox-api.mfkessai.co.jp/v1/transactions/{id}
     */
    public PageReference showTransaction(){
        String id = 'transaction00000001';
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('GET');
        httpRequest.setTimeout(120000);
        httpRequest.setHeader('apikey', access_apikey);
        httpRequest.setEndpoint(endpointRoot + '/transactions/' + id);

        Http http = new Http();
        try {
              HTTPResponse res = http.send(httpRequest);
              this.responseBody = res.getBody();
              System.debug(res.getBody());
        } catch (Exception e){
            throw e;
        }
        return null;
    }

    /**
     * 取引をキャンセル
     *    Http請求方式：POST
     *    URL:https://sandbox-api.mfkessai.co.jp/v1/transactions/{id}/cancel
     */
    public PageReference cancelTransaction(){
        String id = 'transaction00000001';
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('POST');
        httpRequest.setTimeout(120000);
        httpRequest.setHeader('apikey', access_apikey);
        httpRequest.setHeader('Content-Type', 'application/json');
        httpRequest.setHeader('Accept','application/json');
        httpRequest.setBody(this.getJsonData());
        httpRequest.setEndpoint(endpointRoot + '/transactions/' + id + '/cancel');

        Http http = new Http();
        try {
              HTTPResponse res = http.send(httpRequest);
              this.responseBody = res.getBody();
              System.debug(res.getBody());
        } catch (Exception e){
            throw e;
        }
        return null;
    }

    public String getJsonData(){
        String strJsonData = 
			'{\n' + 
			'  "amount": 4000,\n' + 
			'  "date": "2017-08-01T00:00:00+09:00",\n' + 
			'  "destination": {\n' + 
			'    "address1": "千代田区1-2-3",\n' + 
			'    "address2": "サンプルビル3F",\n' + 
			'    "cc_emails": [\n' + 
			'      "another.tanto1@example.jp",\n' + 
			'      "another.tanto2@example.jp"\n' + 
			'    ],\n' + 
			'    "customer": {\n' + 
			'      "office_name": "サンプル商事株式会社",\n' + 
			'      "user_defined_id": "customer123456"\n' + 
			'    },\n' + 
			'    "customer_id": "ABCD-EFGH",\n' + 
			'    "department": "経理部",\n' + 
			'    "email": "kesai.tanto@example.jp",\n' + 
			'    "name": "請求先氏名",\n' + 
			'    "prefecture": "東京都",\n' + 
			'    "tel": "03-1234-5678",\n' + 
			'    "title": "",\n' + 
			'    "zip_code": "111-1111"\n' + 
			'  },\n' + 
			'  "destination_id": "XXXX-YYYY",\n' + 
			'  "due_date": "2017-08-31T00:00:00+09:00",\n' + 
			'  "email_flag": true,\n' + 
			'  "posting_flag": false,\n' + 
			'  "transaction_details": [\n' + 
			'    {\n' + 
			'      "amount": 2000,\n' + 
			'      "description": "商品名A",\n' + 
			'      "quantity": 2,\n' + 
			'      "unit_price": 1000\n' + 
			'    },\n' + 
			'    {\n' + 
			'      "amount": 2000,\n' + 
			'      "description": "商品名A",\n' + 
			'      "quantity": 2,\n' + 
			'      "unit_price": 1000\n' + 
			'    },\n' + 
			'    {\n' + 
			'      "amount": 2000,\n' + 
			'      "description": "商品名A",\n' + 
			'      "quantity": 2,\n' + 
			'      "unit_price": 1000\n' + 
			'    }\n' + 
			'  ],\n' + 
			'  "user_defined_id": "transaction00000001"\n' + 
			'}\n';

        return strJsonData;
    }
}