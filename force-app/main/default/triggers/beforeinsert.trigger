trigger beforeinsert on Account (before insert,before update) {
    system.debug('trigger before insert');
    Account acc = new Account(Name ='Test12 Varsha Before Insert');
    insert acc;

}