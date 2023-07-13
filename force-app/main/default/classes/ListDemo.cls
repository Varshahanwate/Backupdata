public class ListDemo {
    public  void listMEmethod(){
        list<String>strilst =new list<String>();
        
        list<String>strilist2 = new list<string>();
        list<Integer>intlist = new list<Integer>{1,2,3,4,5,6};
        strilst.add('India');
        strilst.add('USA');
        strilst.add('Pakisthan');
        strilst.add(1,'Uk');
        strilist2.add('USA2');
        system.debug('country value'+strilst);
        system.debug('get value='+strilst[0]);
        strilist2.addAll(strilst);
        system.debug('element of Index 3='+strilst[3]);
        System.debug('Adding element "10" at index 3');
        intlist.add(3, 10);
        System.debug('Updated List = ' + intlist);
        System.debug('Element at index 3 using get() = ' +intlist.get(3));
        system.debug('integer'+ intlist);
       // system.debug('Adding string 'Nagpur' at index 2);
        //strilst.add(2,'Nagpur');
        //system.debug('update list country =' + strilst);
        
        
}
}