public class myController {
    public string myString;
    
    Public String getMyString (){
        return 'geMyString';
    }
    
    Public String getStringMethod1 (){
        return myString;
    }
    
    public String getStringMethod2 () {
        if(myString == null) 
            myString ='Method2';
        
        return myString;
    }
    
    
    Public MyController(){
    
    Account account = new Account();
    
    }
    
    Public MyController(SObject obj){
    
    Account account = (Account) obj;
    
    }
 
 
    
}