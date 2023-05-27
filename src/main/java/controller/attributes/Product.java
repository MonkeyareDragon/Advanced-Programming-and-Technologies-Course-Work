package controller.attributes;

public class Product {
    private int id;
    private String name;
    private String category;
    private String brand;
    private String photo;
    private double price;
    private int stock;
    private double rating;

    public Product(int id, String name, String category, String brand, String photo, double price, int stock, double rating) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.brand = brand;
        this.photo = photo;
        this.price = price;
        this.stock = stock;
        this.rating = rating;
    }

    // Getter methods for each private field

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getBrand() {
        return brand;
    }

    public String getPhoto() {
        return photo;
    }

    public double getPrice() {
        return price;
    }

    public int getStock() {
        return stock;
    }

    public double getRating() {
        return rating;
    }
}
