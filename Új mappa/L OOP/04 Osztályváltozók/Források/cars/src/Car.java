public class Car {
    // Osztályváltozó
    static int count = 0;

    // Példányváltozó
    String model;

    // Konstruktor
    public Car(String model) {
        this.model = model;
        count++; // Növeli a példányok számát
    }

    // Osztályváltozó értékének lekérdezése
    public static int getCount() {
        return count;
    }

    // Példányváltozó értékének lekérdezése
    public String getModel() {
        return model;
    }
}

