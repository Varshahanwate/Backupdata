public class DemoApex {
    public static void  myDemomethod(){
    List<Account> acclist = New List<Account>();
        for(Account acc :acclist){
             acc.name='Ram';
            system.debug('Name'+acc);
        }
       insert acclist;
}

}