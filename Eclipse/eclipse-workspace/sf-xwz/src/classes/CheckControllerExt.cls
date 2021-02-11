public class CheckControllerExt {
    
    public CheckControllerExt (CheckController controller) {
        System.debug('◆◆◆◆CheckControllerExt :START');
        
        System.debug('◆◆コンストラクタ');
        
        System.debug('◆◆◆◆CheckControllerExt :END');
    }
    
    public PageReference init() {
        System.debug('◆◆◆◆initExt:START');
        
        System.debug('◆◆PageAction');
        
        System.debug('◆◆◆◆initExt:END');
        return null;
    }

    public String getCount() {
        System.debug('◆◆Ext:getCount()');
        return '123456789';
    }   
}