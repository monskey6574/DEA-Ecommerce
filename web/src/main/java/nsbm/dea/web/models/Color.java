package nsbm.dea.web.models;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Color {
    private int id;
    private int categoryId;
    private String createdBy;
    private String slug;
    private String name;
    private String hex;
    private int quantity;
    private BigDecimal price;
    private Timestamp created;
    private Timestamp modified;

    public Color() {
    }

    public Color(int id, int categoryId, String createdBy, String slug, String name, String hex, BigDecimal price,
                 int quantity) {
        this.id = id;
        this.categoryId = categoryId;
        this.createdBy = createdBy;
        this.slug = slug;
        this.name = name;
        this.hex = hex;
        this.price = price;
        this.quantity = quantity;
    }

    public Color(int id, int categoryId, String createdBy, String slug, String name, String hex, BigDecimal price,
                 int quantity, Timestamp created, Timestamp modified) {
        this.id = id;
        this.categoryId = categoryId;
        this.createdBy = createdBy;
        this.slug = slug;
        this.name = name;
        this.hex = hex;
        this.price = price;
        this.quantity = quantity;
        this.created = created;
        this.modified = modified;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHex() {
        return hex;
    }

    public void setHex(String hex) {
        this.hex = hex;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public Timestamp getModified() {
        return modified;
    }

    public void setModified(Timestamp modified) {
        this.modified = modified;
    }
}
