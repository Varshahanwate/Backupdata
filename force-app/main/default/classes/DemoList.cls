public class DemoList {
    public static void mylistmethod(){
        List<Account>acclist = New List<Account>();
            acclist =[select id,Name from Account limit 3];
        System.debug('aclist =='+acclist);
}

}