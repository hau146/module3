package com.example.customer.repository;

import com.example.customer.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> list;
    static {
        list = new ArrayList<>();
        list.add(new Customer("Trương Nguyễn Đình Long","1999-12-20","Đà Nẵng","https://taoanhdep.com/wp-content/uploads/2022/08/65d0d901c19d92bded2e1a0defa3b95e_original-350x265.jpeg"));
        list.add(new Customer("Nguyễn Hữu Hậu","2002-12-12","Đà Nẵng","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbMJCqxMXv8vTuqPGs40iVvIud8XHUVa6RaKkiBJf_2eemCiIJjwRXzHcfMm5BRVX5KsI&usqp=CAU"));
        list.add(new Customer("Phạm Quốc Sang","1999-12-05","Huế","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwDkGOxggtLW0gO40-IIeHLZ4VIrmcKYEycPLpd55g97F9ED5j3Ry4IHVVEH9Fk7CrDiU&usqp=CAU"));
        list.add(new Customer("Đinh Thanh Hải","1998-05-20","Đà Nẵng","https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien-006.jpg"));
    }

    @Override
    public List<Customer> showList() {
        return list;
    }
}
