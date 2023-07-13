public class mapclass {
    public static void mymethod23(){
        Map<Integer, String> m1 = new Map<Integer, String>();
        m1.put(1, 'First item');
        m1.put(2, 'Second item');
        m1.put(3, 'Third item');
        Map<Integer, String> m2 = m1.clone();
        system.debug('map'+m2);
        if(m1.Containskey(3)){
            system.debug('map2'+m1); 
        }
       
        String str = m1.get(2);
        system.assertEquals('Second item', str);
       
        
    }
    
}