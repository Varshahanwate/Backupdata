trigger Updatedate on Contact (before insert,before update) {
    dateApexclass.Mymothod(Trigger.New);

}