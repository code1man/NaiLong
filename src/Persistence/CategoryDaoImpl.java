package Persistence;

import domain.Category;
import domain.CategoryType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {
    public CategoryType StringToCatagory(String string) {
        switch (string) {
            case "EMOJI":
                return CategoryType.EMOJI;
            case "TOY":
                return CategoryType.TOY;
            case "DAILYITEM":
                return CategoryType.DAILYITEM;
            default:
                return null;
        }
    }

    private static final String Get_Category_List = "SELECT category_type AS categoryType FROM category";
    private static final String Get_Category = " SELECT category_type AS categoryType from category where category_type=?";

    @Override
    public List<Category> getCategoryList() {
        List<Category> categoryList = new ArrayList<>();
        Connection connection = DBUtil.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(Get_Category_List);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        while (true) {
            try {
                if (!resultSet.next()) break;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            Category category = new Category();
            try {
                String CategoryType1 = (resultSet.getString("category_type"));
                category.setCategoryType(StringToCatagory(CategoryType1));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            categoryList.add(category);
        }
        DBUtil.closeResultSet(resultSet);
        DBUtil.closeStatement(statement);
        DBUtil.closeConnection(connection);
        return categoryList;
    }

    @Override
    public Category getCategory(String categoryId) throws SQLException {
        Category category = null;
        Connection connection = DBUtil.getConnection();
        PreparedStatement statement = connection.prepareStatement(Get_Category);
        statement.setString(1, categoryId);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String string = resultSet.getString("category_type");

            category = new Category(StringToCatagory(string));

        }
        DBUtil.closeResultSet(resultSet);
        DBUtil.closeStatement(statement);
        DBUtil.closeConnection(connection);
        return category;
    }
}
