public class CustomerInfoTriggerHandler {
    public static void updateCustomerInfo(List<Customer_Info__c> ci){
        List<Product_Price__c> proPrices = [SELECT Id, Name, Price01__c, Price02__c, Price03__c from Product_Price__c];
        for(Customer_Info__c c : ci){
            if(c.Product_Price__c != null){
                for(Product_Price__c p : proPrices){
                    if(c.Product_Price__c == p.Id){
                        c.Price01__c=p.Price01__c;
                        c.Price02__c=p.Price02__c;
                        c.Price03__c=p.Price03__c;
                    }
                }
            }
        }
    }
}