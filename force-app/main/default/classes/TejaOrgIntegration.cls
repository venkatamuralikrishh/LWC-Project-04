public class TejaOrgIntegration {
    public static void getData() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://oscaritsols-dev-ed.my.salesforce.com/services/apexrest/Provider');
        req.setHeader('Authorization', 'Bearer !AQoAQP9SsDRBmn8LzrUgiINmQfFEq1Bg.DXO8CtmMXtj1g9EKn6qiY9ZxXd0Pk7Isc9GjYFmfLf5WJKk.j6jjzAbAjBOdiZj');
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        Integer code = res.getStatusCode();
        String s = res.getBody();
        if(code == 200) {
            System.debug(s);
        }
    }
    public static void postData() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://oscaritsols-dev-ed.my.salesforce.com/services/apexrest/Provider');
        req.setHeader('Authorization', 'Bearer !AQoAQP9SsDRBmn8LzrUgiINmQfFEq1Bg.DXO8CtmMXtj1g9EKn6qiY9ZxXd0Pk7Isc9GjYFmfLf5WJKk.j6jjzAbAjBOdiZj');
        req.setMethod('POST');
        
        req.setBody('{"nm":"Bhargav","ph":"9989332949"}');
        HttpResponse res = h.send(req);
        Integer code = res.getStatusCode();
        String s = res.getBody();
        if(code == 200) {
            System.debug('record inserted successfully');
            System.debug(s);
        }
        else {
            System.debug('record not inserted');
        }
    }
}