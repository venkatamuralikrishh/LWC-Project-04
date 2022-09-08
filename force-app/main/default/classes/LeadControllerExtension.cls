public class LeadControllerExtension {
    public Lead ls{get;set;}
    
    public LeadControllerExtension(Apexpages.StandardController l) {
        sObject obj = l.getRecord();
        if(obj != null) {
            ls = (Lead)obj;
        }
        else {
            ls = new Lead();
        }
    }
    public Pagereference Save()
   {
        insert ls;
        pageReference ps = new pageReference(ApexPages.currentPage().getURL());
        ps.setRedirect(TRUE);
        return ps;		      
   }
}