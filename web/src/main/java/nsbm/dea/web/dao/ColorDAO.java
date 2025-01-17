package nsbm.dea.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import nsbm.dea.web.connections.DB;
import nsbm.dea.web.models.Color;

public class ColorDAO {

    public ColorDAO() {
    }

    public void create(Color[] colors) throws SQLException {
        String sql = "INSERT INTO dea.colors(category_id, created_by, name, hex, qty, price) VALUES";
        for (int index = 0; index < colors.length; index++) {
            sql = String.format("%s (?, CAST(? as ulid), ?, ?, ?, ?)", sql);
            if (index != colors.length - 1) {
                sql = String.format("%s,", sql);
            }
        }

        try (Connection connection = DB.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                int index = 1;
                for (Color color : colors) {
                    statement.setInt(index++, color.getCategoryId());
                    statement.setString(index++, color.getCreatedBy());
                    statement.setString(index++, color.getName());
                    statement.setString(index++, color.getHex());
                    statement.setInt(index++, color.getQuantity());
                    statement.setBigDecimal(index++, color.getPrice());
                }

                statement.executeUpdate();
            }
        }
    }

    public void create(Color[] colors, int categoryId) throws SQLException {
        String sql = "INSERT INTO dea.colors(category_id, created_by, name, hex, qty, price) VALUES";
        for (int index = 0; index < colors.length; index++) {
            sql = String.format("%s (?, CAST(? as ulid), ?, ?, ?, ?)", sql);
            if (index != colors.length - 1) {
                sql = String.format("%s,", sql);
            }
        }

        try (Connection connection = DB.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                int index = 1;
                for (Color color : colors) {
                    statement.setInt(index++, categoryId);
                    statement.setString(index++, color.getCreatedBy());
                    statement.setString(index++, color.getName());
                    statement.setString(index++, color.getHex());
                    statement.setInt(index++, color.getQuantity());
                    statement.setBigDecimal(index++, color.getPrice());
                }

                statement.executeUpdate();
            }
        }
    }

}
