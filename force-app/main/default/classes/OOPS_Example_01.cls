public class OOPS_Example_01 {
    public class Inner01{
        public Inner02 i2;
    }
    public class Inner02{
        public Inner03 i3;
    }
    public class Inner03{
        public String firstName;
        public String lastName;
    }
    public void m1(Inner03 i3){
        System.debug(i3.firstName + ' ' + i3.lastName);
    }
}