package com.elstr.exmpl;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Orders {
    private Long id;
    private Long userId;
    private String userName;
    private String userSurname;
    private String phone;
    private String address;
    private String email;
    private Object comment;
    private Object dataTime;
    private User userByUserId;
    private Collection<OrdersProducts> ordersProductsById;

    @Id
    @Column(name = "ID", nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "USER_ID", nullable = true)
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "USER_NAME", nullable = false, length = 255)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "USER_SURNAME", nullable = false, length = 255)
    public String getUserSurname() {
        return userSurname;
    }

    public void setUserSurname(String userSurname) {
        this.userSurname = userSurname;
    }

    @Basic
    @Column(name = "PHONE", nullable = false, length = 32)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "ADDRESS", nullable = false, length = 512)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "EMAIL", nullable = true, length = 255)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "COMMENT", nullable = true, length = -1)
    public Object getComment() {
        return comment;
    }

    public void setComment(Object comment) {
        this.comment = comment;
    }

    @Basic
    @Column(name = "DATA_TIME", nullable = false)
    public Object getDataTime() {
        return dataTime;
    }

    public void setDataTime(Object dataTime) {
        this.dataTime = dataTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Orders orders = (Orders) o;
        return Objects.equals(id, orders.id) && Objects.equals(userId, orders.userId) && Objects.equals(userName, orders.userName) && Objects.equals(userSurname, orders.userSurname) && Objects.equals(phone, orders.phone) && Objects.equals(address, orders.address) && Objects.equals(email, orders.email) && Objects.equals(comment, orders.comment) && Objects.equals(dataTime, orders.dataTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userId, userName, userSurname, phone, address, email, comment, dataTime);
    }

    @ManyToOne
    @JoinColumn(name = "USER_ID", referencedColumnName = "ID")
    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    @OneToMany(mappedBy = "ordersByOrdersId")
    public Collection<OrdersProducts> getOrdersProductsById() {
        return ordersProductsById;
    }

    public void setOrdersProductsById(Collection<OrdersProducts> ordersProductsById) {
        this.ordersProductsById = ordersProductsById;
    }
}
