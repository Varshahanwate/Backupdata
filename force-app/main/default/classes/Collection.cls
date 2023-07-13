public class Collection 
{
    public static void Mymethod()
    {
        // create the object of the collection
        list<Integer> Lst = new list<Integer>();
        // Adding the element of the collection
        integer[] intvalue = new  integer[] {10,20,100,5,35,10,25};
            Lst.AddAll(intvalue);
        system.debug('After adding the element...'+Lst);
        if(Lst.contains(10))
            system.debug('Find the 10 number from list'+10);
        system.debug(' print the index number......'+Lst.indexof(10));
         system.debug('print the index value......'+10);
        
        // search for the element
        if(Lst.contains(10))
           
         system.debug(' print the index number......'+Lst.indexof(20));
            system.debug('print the index value......'+20);
       
         if(Lst.contains(10))
            
        system.debug(' print the index number......'+Lst.indexof(100));
          system.debug('print the index value......'+100);
        
         if(Lst.contains(10))
            
         system.debug(' print the index number......'+Lst.indexof(5));
          system.debug('print the index value......'+5);
        
         if(Lst.contains(10))
          
       system.debug(' print the index number......'+Lst.indexof(35));
          system.debug('print the index value......'+35);
        
         if(Lst.contains(10))
           
        system.debug(' print the index number......'+Lst.indexof(10));
          system.debug('print the index value......'+10);
        
         if(Lst.contains(10))
            
         system.debug(' print the index number......'+Lst.indexof(25));
          system.debug('print the index value......'+25);
       
            }
}