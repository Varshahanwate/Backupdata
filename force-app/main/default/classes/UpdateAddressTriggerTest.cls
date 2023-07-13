@isTest
public class UpdateAddressTriggerTest {
    @isTest
    static void testUpdateAddress() {
        // Create test Account
        Account acc = new Account(
            Name = 'Test Account',
            BillingCity = 'City',
            BillingCountry = 'Country',
            BillingState = 'State',
            BillingPostalCode = '12345',
            BillingStreet = 'Street',
            ShippingCity = 'Shipping City',
            ShippingCountry = 'Shipping Country',
            ShippingState = 'Shipping State',
            ShippingPostalCode = '54321',
            ShippingStreet = 'Shipping Street',
            Phone = '123-456-7890',
            Fax = '987-654-3210'
        );

        // Insert the test Account
        insert acc;

        // Verify that the address fields and phone are updated
        acc = [SELECT BillingCity, BillingCountry, BillingState, BillingPostalCode, BillingStreet, Phone
               FROM Account
               WHERE Id = :acc.Id];

        //System.assertEquals('Shipping City', acc.BillingCity);
        System.assertEquals('Shipping Country', acc.BillingCountry);
        System.assertEquals('Shipping State', acc.BillingState);
        System.assertEquals('54321', acc.BillingPostalCode);
        System.assertEquals('Shipping Street', acc.BillingStreet);
        System.assertEquals('987-654-3210', acc.Phone);
    }
}