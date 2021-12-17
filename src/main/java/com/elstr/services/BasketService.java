package com.elstr.services;

import com.elstr.dto.UserDto;
import com.elstr.entities.order.Orders;
import com.elstr.entities.order.OrdersProducts;
import com.elstr.entities.product.Product;
import com.elstr.entities.user.User;
import com.elstr.repository.OrdersProductsRepository;
import com.elstr.repository.OrdersRepository;
import com.elstr.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class BasketService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrdersProductsRepository ordersProductsRepository;

    @Autowired
    private OrdersRepository ordersRepository;

    @Autowired
    private MainSenderService mainSender;

    public OrdersProducts productToBasket(Long productId, User activeUser, String dataCookie) {
        OrdersProducts order = new OrdersProducts();
        order.setProduct(productRepository.getById(productId));
        order.setCount(1L);
        order.setStatus("inBasket");

        order.setDataCookie(dataCookie);

        if (activeUser!=null){
            order.setActiveUserId(activeUser.getId());
        }
        ordersProductsRepository.save(order);

        return order;
    }

    @Transactional
    public void saveOrder(UserDto user, String dataCookie, User activeUser, List<Long> count, List<BigDecimal> price) {
//        User userToDB = UserMapper.INSTANCE.toEntity(user);
        Orders orders = new Orders();
        orders.setUserName(user.getName());
        orders.setUserSurname(user.getSurname());
        orders.setPhone(user.getPhoneNumber());
        orders.setEmail(user.getEmail());
        orders.setCountry(user.getCountryName());
        orders.setCity(user.getCityName());
        orders.setPostcode(user.getPostcode());
        orders.setApartmentAddress(user.getApartmentAddress());
        Date date = new Date();
        orders.setDataTime(date);

        if(activeUser!=null){
            orders.setUser(activeUser);
        }

        ordersRepository.save(orders);

        List<OrdersProducts> ordersProductsList;
        if(activeUser!=null){
            ordersProductsList = ordersProductsRepository.findOrdersProductsByActiveUserIdAndStatus(activeUser.getId(), "inBasket");
        } else {
            ordersProductsList = ordersProductsRepository.findOrdersProductsByDataCookieAndStatusAndActiveUserId(dataCookie, "inBasket", null);
        }
        int tempIndex = 0;
        for (OrdersProducts orderProduct :
                ordersProductsList) {
            orderProduct.setOrders(orders);
            orderProduct.setCount(count.get(tempIndex));
            BigDecimal sum = price.get(tempIndex).multiply(BigDecimal.valueOf(count.get(tempIndex)));
            orderProduct.setOrderSum(sum);
            orderProduct.getProduct().setCount(orderProduct.getProduct().getCount() - count.get(tempIndex));
            tempIndex++;
            orderProduct.setStatus("The order has been placed");
            ordersProductsRepository.save(orderProduct);
        }
        sendMessage(user.getEmail(), ordersProductsList);
    }

    public void deleteOrderWithProductCountZero(String dataCookie) {
        List<Product> productList = productRepository.findAllByCountLessThan(1L);
        for (Product product :
                productList) {
            try {
                ordersProductsRepository.deleteAllByProduct_IdAndDataCookie(product.getId(), dataCookie);
            } catch (Exception exception) {
                exception.printStackTrace();
            }
        }
    }

    private void sendMessage(String email, List<OrdersProducts> productName) {
        if (!StringUtils.isEmpty(email)) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Your order: \n" +
                            "%s",
                    email,
                    productName.toString()
            );

            mainSender.send(email, "Your order", message);
        }
    }
}

