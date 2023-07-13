trigger updateadress on Account (before insert,before update,after insert) {
    for(Account acc:trigger.new){
        //we check null adresss first
        if(acc.BillingCity!=Null && acc.BillingCountry!=null && acc.BillingState!= null && acc.BillingPostalCode!=null && acc.BillingStreet!=null){
            acc.BillingCity = acc.ShippingCity;
            acc.BillingCountry =acc.ShippingCountry;
                acc.BillingState =acc.ShippingState;
                acc.BillingPostalCode =acc.ShippingPostalCode;
            acc.BillingStreet =acc.ShippingStreet;
            acc.Phone = acc.Fax;
            }
    }
    }