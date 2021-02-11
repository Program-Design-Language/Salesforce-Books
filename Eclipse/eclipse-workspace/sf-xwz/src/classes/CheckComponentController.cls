public class CheckComponentController extends CheckBaseController {
    
    public CheckComponentController() {
        System.debug('◆◆◆◆CheckComponentController:START');
        
        System.debug('◆◆コンポーネント・コンストラクタ');
        
        System.debug('◆◆◆◆CheckComponentController:END');
    }
    
    public String getComponentCount() {
        System.debug('◆◆getComponentCount()');
        return '987654321';
    }
}