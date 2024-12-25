package Persistence;

import Persistence.DBUtil;
import domain.Item;
import domain.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class SearchDaoImpl implements SearchDao {
    @Override
    public List<Item> SearchItems(String keyword) {
        items.clear();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SEARCH_SQL)) {

            // 设置查询条件，使用 % 进行模糊匹配
            String likeKeyword = "%" + keyword + "%";  // 在前后加上 % 实现模糊匹配
            stmt.setString(1, likeKeyword);
            stmt.setString(2, likeKeyword);
            stmt.setString(3, likeKeyword);

            // 执行查询
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // 将结果添加到列表
                    items.add(resultSetToItem(rs));
                }
            }
        } catch (SQLException e) {
            System.out.println("搜索查询错误");
            e.printStackTrace();
        }
        return items;
    }

    private Item resultSetToItem(ResultSet rs) throws SQLException {               //查询结果中的一个对象
        int id = rs.getInt("item_id");
        String name = rs.getString("item_name");

        return new Item(id, name);
    }

    public static void main(String[] args) {
        List<Item> list = new SearchDaoImpl().SearchItems("奶龙");
        for (Item item : list) {
            System.out.println(item.getId() + " " + item.getName());
        }
    }
}
