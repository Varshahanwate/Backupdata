public class setExample {
  public set<string> names {get;set;}
  public setExample()
  {
    names = new set<string>();
    names.add('one');
    names.add('two');
    names.add('Ajinkya');
    names.add('one');
    names.add('one');
   }
}