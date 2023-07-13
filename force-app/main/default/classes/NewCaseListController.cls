public class NewCaseListController {
    public List<Case>getNewCases(){
        List<Case> filterList =[select ID,CaseNumber from case where status = 'New'];
        return filterList;
    }

}