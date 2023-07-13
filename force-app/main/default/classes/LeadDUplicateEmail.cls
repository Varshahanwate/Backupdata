public class LeadDUplicateEmail {
    public static void DuplicateEmailnotallow(List<Lead>lelist){
        
        List<String>strlist =new  List<String>();
        for(Lead le:lelist){
            strlist.add(le.email);
        }    
        List<contact> conlist =[SELECT Id,Email from Contact where Email IN:strlist ];
        for(Lead l:lelist){
            if(conlist.size()>0){
                l.addError('can not use email lead it already exists in contact');
            }
        }

    }
    public static void DuplicateEmailnotallowinlead(List<Lead>lelistEmail){
        List<string>stlist =new List<String>();
        set<String>setList = new Set<String>();
        for(Lead l:lelistEmail){
            if(l.Email!=Null){
            stlist.add(l.Email);
            }
        }
        List<Lead>llist=[select Id,Name,Email from Lead ];
        for(lead le:llist){
            setList.add(le.Email);
        }
        for(Lead led :lelistEmail){
            if(setList.contains(led.Email)){
                led.Email.Adderror('inter uniqe email ');
            }
}
    }

}