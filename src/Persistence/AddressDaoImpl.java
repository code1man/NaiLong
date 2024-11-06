package Persistence;

import domain.Address;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDaoImpl implements AddressDao {
    private static final String INSERT_ADDRESS = "INSERT INTO address(user_id, province, city, district, detail_address, phone_number, receiver_name, is_default) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_ADDRESSES_BY_USER_ID = "SELECT * FROM address WHERE user_id = ?";
    private static final String UPDATE_ADDRESS = "UPDATE address SET province = ?, city = ?, district = ?, detail_address = ?, phone_number = ?, receiver_name = ?, is_default = ? WHERE id = ?";
    private static final String DELETE_ADDRESS = "DELETE FROM address WHERE id = ?";

    @Override
    public List<Address> getAllAddressById(int userId) { // 根据用户ID获取所有地址
        List<Address> addressList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ADDRESSES_BY_USER_ID);
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Address address = this.resultSetToAddress(resultSet);
                addressList.add(address);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addressList;
    }         //根据当前用户的id获取所有收货地址信息

    @Override
    public void addAddress(Address address) { // 添加新地址
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement;
            boolean is_Default = address.getIs_default();
            int user_id = address.getUser_id();
            if(is_Default) {
                String updateQuery = "UPDATE address SET is_default = false WHERE user_id = ?";
                preparedStatement = connection.prepareStatement(updateQuery);
                preparedStatement.setInt(1, user_id);
                preparedStatement.executeUpdate();
            }
            preparedStatement = connection.prepareStatement(INSERT_ADDRESS);
            preparedStatement.setInt(1, address.getUser_id());
            preparedStatement.setString(2, address.getProvince());
            preparedStatement.setString(3, address.getCity());
            preparedStatement.setString(4, address.getDistrict());
            preparedStatement.setString(5, address.getDetail_address());
            preparedStatement.setString(6, address.getPhone_number());
            preparedStatement.setString(7, address.getReceiver_name());
            preparedStatement.setBoolean(8, address.getIs_default());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteAddress(Address address) { // 删除地址
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ADDRESS);
            preparedStatement.setInt(1, address.getId());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateAddress(Address address) { // 更新地址信息
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ADDRESS);
            preparedStatement.setString(1, address.getProvince());
            preparedStatement.setString(2, address.getCity());
            preparedStatement.setString(3, address.getDistrict());
            preparedStatement.setString(4, address.getDetail_address());
            preparedStatement.setString(5, address.getPhone_number());
            preparedStatement.setString(6, address.getReceiver_name());
            preparedStatement.setBoolean(7, address.getIs_default());
            preparedStatement.setInt(8, address.getId());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Address resultSetToAddress(ResultSet resultSet) throws SQLException {
        Address address = new Address();
        address.setId(resultSet.getInt("id"));
        address.setUser_id(resultSet.getInt("user_id"));
        address.setProvince(resultSet.getString("province"));
        address.setCity(resultSet.getString("city"));
        address.setDistrict(resultSet.getString("district"));
        address.setDetail_address(resultSet.getString("detail_address"));
        address.setPhone_number(resultSet.getString("phone_number"));
        address.setReceiver_name(resultSet.getString("receiver_name"));
        address.setIs_default(resultSet.getBoolean("is_default")); // 直接使用 boolean 类型
        return address;
    }

}
