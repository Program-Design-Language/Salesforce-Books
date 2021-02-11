public class CheckControllerExt2 {
    
    public CheckControllerExt2 (CheckController controller) {
        System.debug('◆◆◆◆CheckControllerExt2 :START');
        
        System.debug('◆◆コンストラクタ');
        
        System.debug('◆◆◆◆CheckControllerExt2 :END');
    }
    
    public PageReference init() {
        System.debug('◆◆◆◆initExt2:START');
        
        System.debug('◆◆PageAction');
        
        System.debug('◆◆◆◆initExt2:END');
        return null;
    }

    public String getCount() {
        System.debug('◆◆Ext2:getCount()');
        return '123456789';
    }   
}