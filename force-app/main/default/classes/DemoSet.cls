public class DemoSet {
    public static void myMethod2(){
        List<String>strlist =new List<String>{'D','D'};
        set<String>strset = New set<String>();
        strset.add('India');
        strset.add('CAD');
        strset.addAll(strlist);
        System.debug('strset++>'+strset);
        System.debug('strlist++>'+strlist);
        
    }
 }