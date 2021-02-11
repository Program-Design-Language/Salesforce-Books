public abstract class BasePagingController extends BaseController {
////    private static final Integer DEFAULT_PAGESIZE = 25;
////    private Integer intTotalRows;
////    private Integer intCurrentPageNo;
////
////    protected Integer intDataIndexFrom;
////    protected Integer intDataIndexTo;
////
////    public Boolean isFirstPageEnable {get;set;}
////    public Boolean isPreviousPageEnable {get;set;}
////    public Boolean isNextPageEnable {get;set;}
////    public Boolean isLastPageEnable {get;set;}
////
////    public Integer intTotalPage{get;set;}
////    public String strJumpPageNo{get;set;}
////    public Integer intPageRows{get;set;}
////    public List<Selectoption> pageRowsOptionList{get;set;}
////
////    public BasePagingController(){
////        this.intPageRows = DEFAULT_PAGESIZE;
////        this.pageRowsOptionList.add(new Selectoption(10, 10));
////        this.pageRowsOptionList.add(new Selectoption(25, 25));
////        this.pageRowsOptionList.add(new Selectoption(50, 50));
////        this.pageRowsOptionList.add(new Selectoption(100, 100));
////    }
////
////    public void init(){
////    	
////        this.totalPage = (Integer)Math.ceil((Double)this.totalRows / (Double)this.pageRows);
////        this.currentPageNo = 1;
////        this.updateEnableInfo();
////        this.ComputeDataRange();
////        this.setCurrentPageData();
////    }
////
////    private void updateEnableInfo(){
////        // 【活性／非活性】最初のページ
////        if (this.totalPage > 1 && this.currentPageNo <> 1){
////            this.isFirstPageEnable = true;
////        } else {
////            this.isFirstPageEnable = false;
////        }
////
////        // 【活性／非活性】前へ
////        if (this.currentPageNo > 1){
////            this.isPreviousPageEnable = true;
////        } else {
////            this.isPreviousPageEnable = false;
////        }
////
////        // 【活性／非活性】次へ
////        if (this.totalPage > this.currentPageNo){
////            this.isNextPageEnable = true;
////        } else {
////            this.isNextPageEnable = false;
////        }
////
////        // 【活性／非活性】最後のページ
////        if (this.totalPage > this.currentPageNo){
////            this.isLastPageEnable = true;
////        } else {
////            this.isLastPageEnable = false;
////        }
////    }
////
////    private void ComputeDataRange(){
////        this.dataIndexFrom = (this.currentPageNo - 1) * this.pageRows + 1;
////        this.dataIndexTo = this.currentPageNo * this.pageRows;
////        if (this.dataIndexTo > this.totalRows) {
////            this.dataIndexTo = this.totalRows;
////        }
////    }
////
////    /**
////     * 最初のページ
////     */
////    public PageReference FirstPage() {
////        this.currentPageNo = 1;
////        this.updateEnableInfo();
////        this.ComputeDataRange();
////        this.setCurrentPageData();
////        return null;
////    }
////
////    /**
////     * 前へ
////     */
////    public PageReference PreviousPage() {
////        this.currentPageNo--;
////        this.updateEnableInfo();
////        this.ComputeDataRange();
////        this.setCurrentPageData();
////        return null;
////    }
////
////    /**
////     * 次へ
////     */
////    public PageReference NextPage() {
////        this.currentPageNo++;
////        this.updateEnableInfo();
////        this.ComputeDataRange();
////        this.setCurrentPageData();
////        return null;
////    }
////
////    /**
////     * 最後のページ
////     */
////    public PageReference LastPage() {
////        this.currentPageNo = this.totalPage;
////        this.updateEnableInfo();
////        this.ComputeDataRange();
////        this.setCurrentPageData();
////        return null;
////    }
////
////    /**
////     * 指定のページへ
////     */
////    public PageReference jumpPage() {
////    	// 入力有効性判定
////    	
////    	
////    	
////        this.updateEnableInfo();
////        this.ComputeDataRange();
////        this.setCurrentPageData();
////        return null;
////    }
////
////    /**
////     * ページ表示行数変更処理
////     */
////    public PageReference onChangePageRows() {
////        this.updateEnableInfo();
////        this.ComputeDataRange();
////        this.setCurrentPageData();
////        return null;
////    }
////
////    /**
////     * @description 該当ページデータをセットする。
////     */
////    public abstract void setCurrentPageData();
////
////    /**
////     * @description 対象データを取得する。
////     */
////    public abstract void populateData();
}