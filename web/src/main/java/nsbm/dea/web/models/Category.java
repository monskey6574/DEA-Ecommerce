package nsbm.dea.web.models;

import java.sql.Timestamp;

public class Category {
    private int id;
    private String createdBy;
    private int productId;
    private String slug;
    private String name;
    private Timestamp createdAt;
    private Timestamp modifiedAt;
    private Color[] colors;

    public Category() {

    }

    public Category(int id, String createdBy, String slug, String name) {
        this.id = id;
        this.createdBy = createdBy;
        this.slug = slug;
        this.name = name;
    }

    public Category(int id, String createdBy, String slug, String name, Color[] colors) {
        this.id = id;
        this.createdBy = createdBy;
        this.slug = slug;
        this.name = name;
        this.colors = colors;
    }

    public Category(int id, String createdBy, String slug, String name, Timestamp createdAt, Timestamp modifiedAt) {
        this.id = id;
        this.createdBy = createdBy;
        this.slug = slug;
        this.name = name;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public Category(int id, String createdBy, String slug, String name, Timestamp createdAt, Timestamp modifiedAt,
                    Color[] colors) {
        this.id = id;
        this.createdBy = createdBy;
        this.slug = slug;
        this.name = name;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        this.colors = colors;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(Timestamp modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public Color[] getColors() {
        return colors;
    }

    public void setColors(Color[] colors) {
        this.colors = colors;
    }
}
