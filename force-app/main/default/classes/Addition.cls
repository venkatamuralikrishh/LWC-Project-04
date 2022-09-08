public class Addition {
    @TestVisible Static Integer sum;
    public static Integer add(Integer x, Integer y) {
        sum = x+y;
        return sum;
    }
    public static Integer sub(Integer x, Integer y){
        Integer diff = x-y;
        return diff;
    }
}