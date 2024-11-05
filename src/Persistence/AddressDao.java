package Persistence;

import domain.Address;

import java.util.List;

public interface AddressDao {
    public List<Address> getAllAddressById(int id);
    public void addAddress(Address address);
    public void deleteAddress(Address address);
    public void updateAddress(Address address);
}
