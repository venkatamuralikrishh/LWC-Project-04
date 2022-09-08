@isTest
private class AdditionTest {
    @isTest
    static void addTest() {
        Addition.add(10,20);
        System.assert(Addition.sum == 30,'add method Successful');
    }
}