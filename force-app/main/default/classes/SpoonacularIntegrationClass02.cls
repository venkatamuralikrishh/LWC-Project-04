public class SpoonacularIntegrationClass02 {
    @Auraenabled
    public static Map<String,Object> spoonacularGetMethod() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.spoonacular.com/recipes/complexSearch?apiKey=a856d1a9ee8a4d3d979e949201ccfb20');
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        Integer resCode = res.getStatusCode();
        if(resCode==200) {
            String response = res.getBody();
            Map<String,Object> list1= (Map<String,Object>)JSON.deserializeUntyped(response);
            return list1;
        }
        else {
            return null;
        }
    }
}