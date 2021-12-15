package com.elstr.repository;

import com.elstr.entities.order.OrdersProducts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface OrdersProductsRepository extends JpaRepository<OrdersProducts, Long> {

    List<OrdersProducts> findOrdersProductsByDataCookieAndStatusAndActiveUserId(String sessionId, String status, Long activeUserId);

    List<OrdersProducts> findOrdersProductsByDataCookieAndStatus(String sessionId, String status);

    List<OrdersProducts> findOrdersProductsByActiveUserIdAndStatus(Long activeUserId, String status);

    List<OrdersProducts> findAllByActiveUserIdAndOrders_Id(Long id, Long orderId);

    List<OrdersProducts> findAllByActiveUserIdAndDataCookieAndOrders_Id(Long id, String dataCookie, Long orderId);

    @Transactional
    void deleteAllByProduct_IdAndDataCookie(Long id, String dataCookie);
}
