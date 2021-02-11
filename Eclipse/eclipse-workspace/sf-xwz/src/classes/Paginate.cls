public class Paginate {
    private static final Integer DEFAULT_PAGESIZE = 20;
    public Integer totalRows {get;set;}
    public Integer pageRows {get;set;}
    public Integer totalPage {get;set;}
    public Integer currentPageNo {get;set;}

    public Boolean isFirstPageEnable {get;set;}
    public Boolean isPreviousPageEnable {get;set;}
    public Boolean isNextPageEnable {get;set;}
    public Boolean isLastPageEnable {get;set;}

    public Integer dataIndexFrom {get;set;}
    public Integer dataIndexTo {get;set;}

    public Paginate(Integer totalRows, Integer pageRows){
        this.totalRows = totalRows;
        this.pageRows = pageRows;

        // ページ情報を初期化
        this.init();
    }

    public Paginate(Integer totalRows){
        this.totalRows = totalRows;
        this.pageRows = DEFAULT_PAGESIZE;

        // ページ情報を初期化
        this.init();
    }

    public void init(){
        this.totalPage = (Integer)Math.ceil((Double)this.totalRows / (Double)this.pageRows);
        this.currentPageNo = 1;
        this.updateEnableInfo();
        this.ComputeDataRange();
    }

    private void updateEnableInfo(){
        // 【活性／非活性】最初のページ
        if (this.totalPage > 1 && this.currentPageNo <> 1){
            this.isFirstPageEnable = true;
        } else {
            this.isFirstPageEnable = false;
        }

        // 【活性／非活性】前へ
        if (this.currentPageNo > 1){
            this.isPreviousPageEnable = true;
        } else {
            this.isPreviousPageEnable = false;
        }

        // 【活性／非活性】次へ
        if (this.totalPage > this.currentPageNo){
            this.isNextPageEnable = true;
        } else {
            this.isNextPageEnable = false;
        }

        // 【活性／非活性】最後のページ
        if (this.totalPage > this.currentPageNo){
            this.isLastPageEnable = true;
        } else {
            this.isLastPageEnable = false;
        }
    }

    private void ComputeDataRange(){
        this.dataIndexFrom = (this.currentPageNo - 1) * this.pageRows + 1;
        this.dataIndexTo = this.currentPageNo * this.pageRows;
        if (this.dataIndexTo > this.totalRows) {
            this.dataIndexTo = this.totalRows;
        }
    }

    /**
     * 最初のページ
     */
    public PageReference FirstPage() {
        this.currentPageNo = 1;
        this.updateEnableInfo();
        this.ComputeDataRange();
        return null;
    }

    /**
     * 前へ
     */
    public PageReference PreviousPage() {
        this.currentPageNo--;
        this.updateEnableInfo();
        this.ComputeDataRange();
        return null;
    }

    /**
     * 次へ
     */
    public PageReference NextPage() {
        this.currentPageNo++;
        this.updateEnableInfo();
        this.ComputeDataRange();
        return null;
    }

    /**
     * 最後のページ
     */
    public PageReference LastPage() {
        this.currentPageNo = this.totalPage;
        this.updateEnableInfo();
        this.ComputeDataRange();
        return null;
    }

    /**
     * 指定のページへ
     */
    public PageReference jumpPage() {
        this.updateEnableInfo();
        this.ComputeDataRange();
        return null;
    }
}