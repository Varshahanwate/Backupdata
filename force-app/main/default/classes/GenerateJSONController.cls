public class GenerateJSONController {
    public Integer a {get; set;}
    public Contact Con {get; set;}
    public String finalJSONString{get; set;}
    public GenerateJSONController(){
        Con = new Contact();
        finalJSONString ='';
    }
    public void creatJSONofAccount(){
        List<Account>acclist =[select Name,Industry,(select LastName from Contacts) from Account];
        system.JSONGenerator js= JSON.createGenerator(true);
        js.writeStartObject();
        if(acclist!=null&&acclist.size()>0){
           js.writeFieldName('Account');
          js.writeStartArray();
            for(Account a:acclist){
                js.writeStartObject();
                js.writeStringField('Name', a.Name);
                js.writeStringField('Industry', a.Name);
                js.writeFieldName('Contact');
                js.writeStartArray();
                for(Contact con:a.Contacts){
                    js.writeStartObject();
                   js.writeStringField('LastName', con.LastName);
                    js.writeEndObject();
                }
                js.writeEndArray();
                js.writeEndObject();
            }
            js.writeEndArray();
        }
        
        js.writeFieldName('Status');
        if(acclist !=null && acclist.size()>0){
            js.writeString('Success');
        }
        else{
            js.writeString('Fauiled');
        }
        js.writeEndObject();
        finalJSONString = js.getAsString();
        
        
    }
    
    public void createContact(){
        system.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        js.writeFieldName('Status');
        //finalJSONString = js.getAsString();
        try{
            insert Con;
            js.writeString('Success');
            js.writeIdField('Id', Con.Id);
            js.writeDateField('DateCreated', Date.today());
        }
        catch(Exception e){
            js.writeString('Fail');
           //system.debug('errorr '+ e.getMessage());
            js.writeStringField('Error Message', e.getMessage());
        }
        js.writeEndObject();
        finalJSONString = js.getAsString();
        
    }
    public void createJSON(){
        system.JSONGenerator js= JSON.createGenerator(true);
        // use js variable to formate the JSON(DYNAMICALLY),using method defined in JSONGenerator class
        js.writeStartObject();
        js.writeStringField('FirstName', 'paa');
        js.writeStringField('LastName', 'Hanwate');
        js.writeFieldName('Status');
        if(a>10){
            js.writeString('success');
            
        }
        else{
            js.writeString('failuar');
        }
        js.writeEndObject();
        finalJSONString = js.getAsString();
     
        
    }
}