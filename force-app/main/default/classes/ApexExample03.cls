public class ApexExample03 {
    public void callMe(){
        User u = [SELECT id from User WHERE alias='mkris' LIMIT 1];
        List<Opportunity> optyList = [SELECT id,stageName from Opportunity where ownerId=:u.Id];
        for(Opportunity op : optyList){
            op.stageName='Closed Won';
            op.closeDate=system.today();
        }
        update optyList;
    }
    public void show(){
        User u = [SELECT id from User where alias='mkris'];
        List<Opportunity> optyList = [SELECT id,stageName from Opportunity where ownerId=:u.Id];
        delete optyList;
    }
}