package domain;

public class Address {
    private int id;
    private int user_id;
    private String province;
    private String city;
    private String district;
    private String detail_address;
    private String phone_number;
    private String receiver_name;
    private boolean is_default; // 将类型改为 boolean

    public Address() {
    }

    public Address(int user_id, String province, String city, String district, String detail_address, String phone_number, String receiver_name, boolean is_default) {
        this.user_id = user_id;
        this.province = province;
        this.city = city;
        this.district = district;
        this.detail_address = detail_address;
        this.phone_number = phone_number;
        this.receiver_name = receiver_name;
        this.is_default = is_default;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getDetail_address() {
        return detail_address;
    }

    public void setDetail_address(String detail_address) {
        this.detail_address = detail_address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getReceiver_name() {
        return receiver_name;
    }

    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
    }

    public boolean getIs_default() { // 这里的命名规则
        return is_default;
    }

    public void setIs_default(boolean is_default) {
        this.is_default = is_default;
    }
}
