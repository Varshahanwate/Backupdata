public class CreatehttpIntagration {
    public static void addContact(){
        HTTp tt = new Http ();
        HTTPRequest httpreqt = new HTTPRequest();
       
      httpreqt.setEndpoint('https://varshabopchesfdc.api-us1.com/admin/api.php?api_action=contact_add');
         httpreqt.setMethod('POST');
         string payload = 'api_key=39d5129d3d8a4b6a1b62bfd530ab26feec21c4761d21cd5bff6be5dc3fae1f33f715e447&first_name=Sneha&last_name=Def&email=varsha@gmail.com';
        httpreqt.setHeader('Content-Type','application/x-www-form-urlencoded');
       httpreqt.setBody(payload);
        
       HTTPResponse res = tt.send(httpreqt);
        if(res.getStatusCode()==200){
            system.debug(res.getBody());
        }
    }
}