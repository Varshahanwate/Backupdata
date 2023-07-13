public class Leadcreation {
    public static void leadcreation2(String lastName, String company, String email){
        lead newlead = new Lead();
        newlead.lastName = lastName;
        newlead.company=company;
        newlead.email =email;
        insert newlead;
    }
}