public class Schema_Example01 {
    //object name is the key and objectType is the value
    public Map<String,schema.SObjectType> sc {get;set;}
    public Schema_Example01(){
        sc = schema.getGlobalDescribe(); // it will return all the objects in the database in the form of map
    }
}