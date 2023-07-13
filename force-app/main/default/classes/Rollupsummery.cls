public class Rollupsummery {
    public static void Countcontacts(List<Contact> newlist,List<Contact>oldlist){
        set<Id>accid =new set<Id>();
        if(newlist!=null){
            for(Contact c:newlist){
                if(c.AccountId!=null){
                    accid.add(c.AccountId);
                }
            }
        }
        if(oldlist!=null){
            for(Contact c:oldlist){
                accid.add(c.AccountId);
            }
        }
        List<Account>acc=[select id,CountContacts__c,(select id from Contacts)from Account Where id IN:accid];//
        for(Account accvalue:acc){
            accvalue.CountContacts__c =accvalue.Contacts.size();
        }
        if(!acc.isempty()){
            update acc;
        }
    }
    
    /*  Task 1 --Write a trigger on account when account is update check all opportunity inside the account update all opportunity stage to close lost
* if an opportunity  created date is greater than 30 days from today and stage not equal to close won */
    
    public static void updateopprtunity(List<Account>acclist){
        //Create a list to hold the opportunities that need to be updated
        List<Opportunity> oppsToUpdate = new List<Opportunity>();
        Datetime day =system.now()-30;
        
        //Iterate over the updated accounts
        for(Account acct : acclist) {
            //Only process accounts where the record has been updated and the update did not come from the system
            //Get all related opportunities for the account
            List<Opportunity> opps = [SELECT Id, CreatedDate, StageName FROM Opportunity WHERE AccountId = :acct.Id];
            
            //Iterate over the opportunities
            for(Opportunity opp : opps) {
                //Check if the opportunity was created more than 30 days ago and is not already closed won
                if(opp.CreatedDate > day && opp.StageName != 'Closed Won') {
                    //Set the opportunity stage to Closed Lost and add it to the list to be updated
                    opp.StageName = 'Closed Lost';
                    oppsToUpdate.add(opp);
                }
            }
            If(!oppsToUpdate.isEmpty()){//Update all opportunities that need to be updated
                update oppsToUpdate;
            }
        }
        
    }
    /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Task 2 :--write a trigger ,only system admin user should be able to delet the task*/
    public  static void deletetask(List<Task>oldrecord){
        Id currentUserProfile = userInfo.getProfileId();// geting profile Id of currect user
        Id sysadminProfileId =[select Id,Name from Profile where Name ='System Administrator' Limit 1].Id;
        for(Task taskres :oldrecord){
            if(sysadminProfileId !=currentUserProfile ){//checking systen admin profile with currect use profile
                taskres.addError('You can not the rights do way');   
            }
        }
    }
    /*Task 3:-4..
Once an account will update then that Account will update with the total amount from All Opportunities on Account level.
Account field name would be Total Opportunity Amount*/
    public static void updateTotalopportunity (List<Opportunity>newopplist,List<Opportunity>oldlist){
        Set<Id>accountId = new set<Id>();
        // Collect the Account IDs for all Opportunities being inserted, updated, deleted, or undeleted
        for (Opportunity opp :newopplist) {
            if(opp.Amount != Null && opp.AccountId != Null ){
                accountId.add(opp.AccountId);
            }
        }       
        //for(Opportunity opp :oldlist){
        // if(opp.Amount != Null && opp.AccountId != Null ){
        //  accountId.add(opp.AccountId);
        //}
        // }
        List<Account>accountToupdate = [SELECT Id,Total_sales_quantities__c, (SELECT Amount FROM Opportunities) FROM Account WHERE Id IN :accountId];
        for(Account acc:accountToupdate){
            Double totalAmount = 0;
            for (Opportunity opp : acc.Opportunities) {
                if( opp.Amount!=null){
                    totalAmount += opp.Amount;
                }
            }
            acc.Total_Opportunity_Amount__c = totalAmount;
        }
        update accountToupdate;
    }
    /* Task -4.Once an opportunity line item will create update Opportunity's Account with the total number of Product Quantities.
Create a field first on Account "Total sales quantities".*/
    public static void updateAccountPrctQty(List<OpportunityLineItem> oppList){
        
        Set<Id> oppIds = new Set<Id>();
        Map<Id,Decimal> mapToGetaccQty = new Map<Id,Decimal>();
        List<Account> accountToBeUpdate = new List<Account>();
        List<Opportunity> opp = new List<Opportunity>();
        for(OpportunityLineItem	oli:oppList){
            oppIds.add(oli.OpportunityId); 
            
        }
        for(Opportunity oppListNew:[SELECT Id,AccountId,(SELECT Id,Quantity FROM OpportunityLineItems) FROM Opportunity WHERE Id IN:oppIds]){
            
            if(!mapToGetaccQty.containskey(oppListNew.AccountId)){
                mapToGetaccQty.put(oppListNew.AccountId,0);
                
            }
            for(OpportunityLineItem oliList:oppListNew.OpportunityLineItems){
                mapToGetaccQty.put(oppListNew.AccountId,mapToGetaccQty.get(oppListNew.AccountId) + oliList.Quantity);
            }
        }
        
        
        system.debug('mapToGetaccQty '+mapToGetaccQty);
        for(Account acc:[SELECT Id,Total_sales_quantities__c FROM Account WHERE Id IN:mapToGetaccQty.Keyset()]){
            decimal sum = 0;
            acc.Total_sales_quantities__c = sum;
            if(acc.Total_sales_quantities__c != null){
                acc.Total_sales_quantities__c += mapToGetaccQty.get(acc.Id);
                system.debug('account product qty'+acc.Total_sales_quantities__c);
                accountToBeUpdate.add(acc);
            }
        }
        if(accountToBeUpdate.size()>0){
            update accountToBeUpdate;
        }
    }
    /*Once an Account is inserted an email should go to the System Admin user with specified text below.
An account has been created and the name is “Account Name”.*/
    //To send list of mails when there are insertion of list of Accounts
    public  static void sendEmail(List<Account>acclist){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        //Query to get the Email of a System Administrator
        User userObj=[select Id,Profile.Name,Email from user where Profile.Name='System Administrator'];
        for(Account accObj:acclist){
            //Checking if the user email is not null
            if(userObj.Email!=null){
                //Assigning a single Mail to send
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                //Assigning the Sender Name for Mail
                mail.setSenderDisplayName('Salesforce');
                //We are make all this below fields as false because those are not needed for now
                mail.setUseSignature(false);
                mail.setBccSender(false);
                mail.setSaveAsActivity(false);
                //Assigning the receiver Mail Address
                mail.toAddresses = new String[]{userObj.Email};
                    //Assign the Subject of the Mail
                    mail.setSubject('New Account was Created.');
                //A variable to write the body of the Mail
                String body = 'Dear System Administrator, <br/>';
                body += 'An account has been created and name is '+accObj.Name+'.';
                //Assigning the variable in which we wrote the body to the Mail Body
                mail.setHtmlBody(body);
                //Adding each single mail to be sent to the list of mails
                mails.add(mail);
            }
        }
        //Checking if the list of mails is not empty
        if(mails.size()>0){
            //" Messaging.sendEmail(mails) " is used to send the list of mails
            Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
            //we are checking if the mails are sent or not.
            if (results[0].success)
            {
                System.debug('The email was sent successfully.');
            } else {
                System.debug('The email failed to send: '+ results[0].errors[0].message);
            }
        }
    }
    /*Whenever a new record is created into account object . Before this new record is 
inserted into Account, delete all the contacts records with this account name.*/
    public static void deletcontactwithsameacccountname(List<Account>acclist){
        Set<String>srtName = new set<String>();
        for (Account Ac :acclist){
            srtName.add(ac.Name); 
        }
        List<Contact> conList2 = [Select Id , Name FROM Contact WHERE Name IN :srtName];
        Delete conList2;
    }
    /*Whenever a new contact is created for account update the corresponding account 
phone with the new contact phone field.*/
    Public  static void updatephoneoncontactwithaccount(List<Contact>conlist){
        Set<Id>accountids = new Set<Id>();
        List<Account>acclist =new List<Account>();
        for(Contact con :conlist){
            if(con.AccountId!=null){
             accountids.add(con.AccountId);   
            }
        }
        for(Account accountUpdate : [SELECT Id, Phone, (SELECT Id, Phone FROM Contacts) FROM Account WHERE Id IN :accountIds]){
        String accountPhone = accountUpdate.Phone;
  // Update the Account Phone with the new Contact Phone
        for(Contact newContact : accountUpdate.Contacts){
            if(newContact.Phone != null && newContact.Phone != ''){
                accountPhone = newContact.Phone;
                break;
            }
        }
        
        // Add the updated Account to the list to be updated
        accountUpdate.Phone = accountPhone;
        acclist.add(accountUpdate);
    }
    
    // Update the Accounts with the new Phone values
    if(acclist.size() > 0){
        update acclist;
    }
}
}