
public class Main {
    public static void main(String[] args) {
        Car car1 = new Car("Toyota");
        Car car2 = new Car("Honda");
        Car car3 = new Car("Ford");

        System.out.println("Példány 1 modellje: " + car1.getModel()); // Toyota
        System.out.println("Példány 2 modellje: " + car2.getModel()); // Honda
        System.out.println("Példány 3 modellje: " + car3.getModel()); // Ford

        System.out.println("Összes létrehozott autó: " + Car.getCount()); // 3
    }
}
