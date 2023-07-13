public class ListExample {
    public void myAccount(){
        List<String>strlist = new List<String>();
        List<String>strlist2 = new List<String>();
        Set<String>setId =new Set<String>();
        sObject obj =[Select Id  from Account limit 1 ];
        boolean res; //boolean expression 
        strlist.add('India');
        strlist.add('A');
        strlist.add('Pakistan');
       strlist.add(1,'UK');
        strlist.add(0,'China');
        System.debug(strlist.Size());//Check size of list all value ex. list size 4
        //System.debug(strlist.isEmpty()); //checking empty list 
        //System.debug(strlist.indexOf('India'));//checking index of India 
      // System.debug('object type==>'+obj.getSObjectType());//check type of object 
       /* strlist.add('Uk');
        setId.add('Japan');
        res = strlist.contains('India'); // here check India in list 1  ig macth value then boolean true print
        System.debug('result ===>'+res);
       strlist2.add('Astrelia');
        //strlist2.addAll(strlist); //AddAll from list
        //strlist2.addAll(setId);// Addall from set
        //strlist2 = strlist.Clone();
        //System.debug('show values='+strlist);
        //strlist.clear();
         //System.debug('show values list 2='+strlist2);
         //System.debug('add set value='+setId);*/
        res =strlist.contains('Maya');
        system.debug('result==>'+res);
    }
    }