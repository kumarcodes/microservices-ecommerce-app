package com.rohit.microservices.order.service;

import com.rohit.microservices.order.client.InventoryClient;
import com.rohit.microservices.order.dto.OrderRequest;
import com.rohit.microservices.order.model.Order;
import com.rohit.microservices.order.repository.OrderRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@AllArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final InventoryClient inventoryClient;

    public void placeOrder(OrderRequest orderRequest) {

        var isProductInStock = inventoryClient.inStock(orderRequest.skuCode(), orderRequest.quantity());

        if (isProductInStock) {
            //Map orderRequest to Order
            Order order = new Order();
            order.setOrderNumber(UUID.randomUUID().toString());
            order.setSkuCode(orderRequest.skuCode());
            order.setPrice(orderRequest.price());
            order.setQuantity(orderRequest.quantity());
            //Save order to order Repository
            orderRepository.save(order);
        } else {
            throw new RuntimeException("Product with SKU " + orderRequest.skuCode() + " is not in stock");
        }
    }
}
