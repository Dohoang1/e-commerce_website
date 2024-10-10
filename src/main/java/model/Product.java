package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private double discount;
    private double stock;

    public Product(int id, String name, double price, double discount, double stock) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.stock = stock;
    }


    public Product(String name, double price, double discount, double stock) {
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.stock = stock;
    }


    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getStock() {
        return stock;
    }

    public void setStock(double stock) {
        this.stock = stock;
    }

    // Phương thức tính giá sau khi giảm giá
    public double getDiscountedPrice() {
        return price * (1 - discount / 100);
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                ", stock=" + stock +
                ", discountedPrice=" + getDiscountedPrice() +
                '}';
    }
}