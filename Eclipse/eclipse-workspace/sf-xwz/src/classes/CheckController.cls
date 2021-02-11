public class CheckController extends CheckBaseController {
    
    public CheckController() {
        System.debug('◆◆◆◆CheckController:START');
        
        System.debug('◆◆コンストラクタ');
        
        System.debug('◆◆◆◆CheckController:END');
    }
    
    public PageReference init() {
        System.debug('◆◆◆◆init:START');
        
        System.debug('◆◆PageAction');
        
        System.debug('◆◆◆◆init:END');
        return null;
    }
    
    public String getCount() {
        System.debug('◆◆getCount()');
        return '123456789';   
    }
}