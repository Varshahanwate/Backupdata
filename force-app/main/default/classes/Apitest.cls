@restResource(urlMapping='/CreateAccountData/')
Global with sharing class Apitest {
    @HTTPGet
    Global static Contact conId(){
        RestRequest Req = RestContext.request;
        string conId = Req.requestURI.substring(Req.requestURI.lastIndexOf('/')+1);
        Contact con = [SELECT ID, LastName,Title  FROM CONTACT WHERE ID =:conId];
        system.debug('contact'+Req.requestURI.substring(Req.requestURI.lastIndexOf('/')+1));
        Return con;
    }
    @HTTPPost
    Global static id ContactInsert(String lastNameofContact, String titleofContact,String Description ){
        Contact cont = new Contact(
        LastName = lastNameofContact,
         Description = Description,  
        Title =  titleofContact
        );
        insert cont;
        Return cont.Id;
    }

}