trigger Duplicatephone on Account (before insert) {
     if(Trigger.isInsert){
         if(Trigger.isBefore){ 
             Apexhandler.duplicatePhoneMethod(Trigger.new);
         }
     }

}