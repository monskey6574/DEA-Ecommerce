package nsbm.dea.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import nsbm.dea.web.connections.DB;
import nsbm.dea.web.models.Category;
import nsbm.dea.web.models.Color;
import nsbm.dea.web.models.Product;

public class ProductDAO {
  private int LIMIT;
  private static final Gson gson = new Gson();

  public ProductDAO() {

  }

  public ProductDAO(int LIMIT) {
    LIMIT = this.LIMIT;
  }

  private Product getProductFromResultSet(ResultSet resultSet) throws SQLException {
    return new Product(
        resultSet.getInt("id"),
        resultSet.getString("created_by"),
        resultSet.getString("slug"),
        resultSet.getString("name"),
        ((String[]) resultSet.getArray("photo_urls").getArray()),
        resultSet.getString("description"),
        resultSet.getTimestamp("created"),
        resultSet.getTimestamp("modified"),
        resultSet.getBigDecimal("price"));
  }

  private Optional<Product> getProduct(PreparedStatement statement) throws SQLException {
    JsonObject productJson;
    try (ResultSet resultSet = statement.executeQuery()) {
      if (!resultSet.next()) {
        return Optional.empty();
      }
      JsonObject payload = JsonParser.parseString(resultSet.getString("data")).getAsJsonObject();
      productJson = payload.getAsJsonObject("product");
    }

    JsonArray categoriesJsonArray = productJson.getAsJsonArray("categories");
    List<Category> categories = new ArrayList<>();
    for (JsonElement categoryElement : categoriesJsonArray) {
      JsonObject categoryJson = categoryElement.getAsJsonObject();

      JsonArray colorsJsonArray = categoryJson.getAsJsonArray("colors");
      List<Color> colors = new ArrayList<>();
      for (JsonElement colorElement : colorsJsonArray) {
        JsonObject colorJson = colorElement.getAsJsonObject();
        Color color = new Color();
        color.setId(colorJson.get("id").getAsInt());
        color.setName(colorJson.get("name").getAsString());
        color.setSlug(colorJson.get("slug").getAsString());
        color.setHex(colorJson.get("hex").getAsString());
        color.setQuantity(colorJson.get("qty").getAsInt());
        color.setCreatedBy(colorJson.get("created_by").getAsString());

        colors.add(color);
      }

      Category category = new Category(
          categoryJson.get("id").getAsInt(),
          categoryJson.get("created_by").getAsString(),
          categoryJson.get("slug").getAsString(),
          categoryJson.get("name").getAsString(),
          colors.stream().toArray(Color[]::new));

      categories.add(category);
    }

    Product product = new Product(
        productJson.get("id").getAsInt(),
        productJson.get("created_by").getAsString(),
        productJson.get("slug").getAsString(),
        productJson.get("name").getAsString(),
        gson.fromJson(productJson.get("photo_urls"), String[].class),
        productJson.get("description").getAsString(),
        productJson.get("price").getAsBigDecimal(),
        categories.stream().toArray(Category[]::new));

    return Optional.of(product);
  }

  public Optional<Product> getProductById(int id) throws SQLException {
    String sql = """
        SELECT
        	jsonb_build_object ('product',
        		jsonb_build_object ('id',
        			products.id,
        			'name',
        			products.name,
        			'description',
        			products.description,
        			'slug',
        			products.slug,
        			'photo_urls',
        			products.photo_urls,
        			'created_by',
        			products.created_by,
        			'created',
        			products.created,
        			'modified',
        			products.modified,
           'price',
                    products.price,
        			'categories',
        			(
        				SELECT
        					jsonb_agg(jsonb_build_object ('id', categories.id, 'name', categories.name, 'slug', categories.slug, 'created_by', categories.created_by, 'created', categories.created, 'modified', categories.modified, 'colors', (
        								SELECT
        									jsonb_agg(jsonb_build_object ('id', colors.id, 'name', colors.name, 'slug', colors.slug, 'hex', colors.hex, 'qty', colors.qty,  'created_by', colors.created_by, 'created', colors.created, 'modified', colors.modified))
        									FROM dea.colors colors
        								WHERE
        									colors.category_id = categories.id)))
        				FROM
        					dea.categories categories
        				WHERE
        					categories.product_id = products.id))) AS data
        	FROM
        		dea.products products
        	WHERE
        		products.id = ?
        	LIMIT 1;
                                       """;

    try (Connection connection = DB.getConnection()) {
      try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setInt(1, id);
        return this.getProduct(statement);
      }
    }
  }

  public Optional<Product> getProductBySlug(String slug) throws SQLException {
    String sql = """
        SELECT
          jsonb_build_object ('product',
            jsonb_build_object ('id',
              products.id,
              'name',
              products.name,
              'description',
              products.description,
              'slug',
              products.slug,
              'photo_urls',
              products.photo_urls,
              'created_by',
              products.created_by,
              'created',
              products.created,
              'modified',
              products.modified,
           'price',
                    products.price,
              'categories',
              (
                SELECT
                  jsonb_agg(jsonb_build_object ('id', categories.id, 'name', categories.name, 'slug', categories.slug, 'created_by', categories.created_by, 'created', categories.created, 'modified', categories.modified, 'colors', (
                        SELECT
                          jsonb_agg(jsonb_build_object ('id', colors.id, 'name', colors.name, 'slug', colors.slug, 'hex', colors.hex, 'qty', colors.qty,  'created_by', colors.created_by, 'created', colors.created, 'modified', colors.modified))
                          FROM dea.colors colors
                        WHERE
                          colors.category_id = categories.id)))
                FROM
                  dea.categories categories
                WHERE
                  categories.product_id = products.id))) AS data
          FROM
            dea.products products
          WHERE
            products.slug = ?
          LIMIT 1;
                                       """;

    try (Connection connection = DB.getConnection()) {
      try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, slug);
        return this.getProduct(statement);
      }
    }
  }

  public List<Product> getAllProducts(int page) throws SQLException {
    List<Product> products = new ArrayList<Product>();

    try (Connection connection = DB.getConnection()) {
      try (PreparedStatement statement = connection
          .prepareStatement("SELECT * FROM dea.products ORDER BY id ")) {
        try (ResultSet resultSet = statement.executeQuery()) {
          while (resultSet.next()) {
            products.add(this.getProductFromResultSet(resultSet));
          }
        }
      }
    }
    return products;
  }

  public List<Product> getAllProducts() throws SQLException {
    return this.getAllProducts(1);
  }

  public List<Product> getProductsByCollection(String slug) throws SQLException {
    List<Product> products = new ArrayList<>();
    String query = """
        SELECT
        	products.*
        FROM
        	dea.products products
        	INNER JOIN dea.product_collections product_collections ON products.id = product_collections.product_id
        	INNER JOIN dea.collections collections ON product_collections.collection_id = collections.id
        WHERE
        	collections.slug = ?;
                """;

    try (Connection conn = DB.getConnection();
        PreparedStatement statement = conn.prepareStatement(query)) {
      statement.setString(1, slug);
      try (ResultSet resultSet = statement.executeQuery()) {
        while (resultSet.next()) {
          products.add(this.getProductFromResultSet(resultSet));
        }
      }

      return products;
    }
  }

  public List<Product> getProductByCategoryName(String CategoryName) throws SQLException {
    List<Product> products = new ArrayList<>();
    String query = "SELECT p.* FROM dea.products p JOIN dea.categories c ON p.id = c.product_id WHERE c.name = ?";
    try (Connection connection = DB.getConnection()) {
      try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setString(1, CategoryName);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
          products.add(this.getProductFromResultSet(rs));
        }
      }
    }
    return products;
  }

  public List<Product> searchProducts(String searchTerm) {
    List<Product> products = new ArrayList<>();
    String query = "SELECT * FROM dea.products WHERE name LIKE ?";
    try (Connection conn = DB.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(query)) {
      pstmt.setString(1, "%" + searchTerm + "%");
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
        products.add(this.getProductFromResultSet(rs));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return products;
  }

}
