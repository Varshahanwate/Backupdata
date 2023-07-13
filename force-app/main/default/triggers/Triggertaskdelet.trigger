trigger Triggertaskdelet on Task (before delete,after delete) {
    Rollupsummery.deletetask(trigger.old);

}