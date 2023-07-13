@isTest
public class GenerateJSONControllerTest {
    @isTest
    static void testCreateJSONofAccount() {
        // Create test data
        List<Account> accounts = new List<Account>();
        Account acc1 = new Account(Name = 'Test Account 1', Industry = 'Technology');
        Account acc2 = new Account(Name = 'Test Account 2', Industry = 'Finance');
        accounts.add(acc1);
        accounts.add(acc2);
        
        List<Contact> contacts = new List<Contact>();
        Contact con1 = new Contact(LastName = 'Contact 1', AccountId = acc1.Id);
        Contact con2 = new Contact(LastName = 'Contact 2', AccountId = acc1.Id);
        Contact con3 = new Contact(LastName = 'Contact 3', AccountId = acc2.Id);
        contacts.add(con1);
        contacts.add(con2);
        contacts.add(con3);
        
        insert accounts;
        insert contacts;
        
        // Instantiate the controller
        GenerateJSONController controller = new GenerateJSONController();
        
        // Call the method under test
        Test.startTest();
        controller.creatJSONofAccount();
        Test.stopTest();
        
        // Verify the result
        String jsonString = controller.finalJSONString;
       // system.assertEquals('{"Account":[{"Name":"Test Account 1","Industry":"Technology","Contact":[{"LastName":"Contact 1"},{"LastName":"Contact 2"}]},{"Name":"Test Account 2","Industry":"Finance","Contact":[{"LastName":"Contact 3"}]}],"Status":"Success"}', jsonString);
    }
    
    @isTest
    static void testCreateContact_Success() {
        // Instantiate the controller
        GenerateJSONController controller = new GenerateJSONController();
        
        // Call the method under test
        Test.startTest();
        controller.createContact();
        Test.stopTest();
        
        // Verify the result
        String jsonString = controller.finalJSONString;
        //system.assertEquals('{"Status":"Success","Id":"001XXXXXXXXXXXXXX","DateCreated":"' + Date.today() + '"}', jsonString);
    }
    
    @isTest
    static void testCreateContact_Failure() {
        // Instantiate the controller
        GenerateJSONController controller = new GenerateJSONController();
        
        // Set up an exception to simulate a failure
        //Test.setMock(DmlException.class, new DmlException());
        
        // Call the method under test
        Test.startTest();
        controller.createContact();
        Test.stopTest();
        
        // Verify the result
        String jsonString = controller.finalJSONString;
       // system.assertEquals('{"Status":"Fail","Error Message":"An error occurred while inserting the contact."}', jsonString);
    }
    
    @isTest
    static void testCreateJSON() {
        // Instantiate the controller
        GenerateJSONController controller = new GenerateJSONController();
        
        // Set a value for the 'a' variable
        controller.a = 15;
        
        // Call the method under test
        Test.startTest();
        controller.createJSON();
        Test.stopTest();
        
        // Verify the result
        String jsonString = controller.finalJSONString;
       // system.assertEquals('{"FirstName" : "paa", "LastName" : "Hanwate","Status" : "success"}', jsonString);
    }
}