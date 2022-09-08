public class ApexExample02 {
    public void callMe(){
        List<Opportunity> opptyList = [SELECT id,stageName from Opportunity];
        for(Opportunity op : opptyList){
            op.stageName='Closed Won';
            op.closeDate=system.today();
        }
        update opptyList;
    }
    public void show(){
        List<Opportunity> opptyList = [SELECT id from Opportunity where createdDate=TODAY];
        DELETE opptyList;
    }
}