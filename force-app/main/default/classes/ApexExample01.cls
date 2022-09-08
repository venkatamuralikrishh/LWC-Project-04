public class ApexExample01 {
	public string name;
    public Date closeDate;
    public string stName;
    public void insertMethod(){
        Opportunity o = new Opportunity();
        o.Name=name;
        o.CloseDate=closeDate;
        o.StageName=stName;
        insert o;
    }
}