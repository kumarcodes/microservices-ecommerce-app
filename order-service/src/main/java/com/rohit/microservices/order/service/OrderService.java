package com.rohit.microservices.order.service;

import com.rohit.microservices.order.client.InventoryClient;
import com.rohit.microservices.order.dto.OrderRequest;
import com.rohit.microservices.order.event.OrderPlacedEvent;
import com.rohit.microservices.order.model.Order;
import com.rohit.microservices.order.repository.OrderRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Slf4j
@Service
@AllArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final InventoryClient inventoryClient;
    private final KafkaTemplate<String, OrderPlacedEvent> kafkaTemplate;

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
            //Send the message to Kafka Topic with Order Details(Order Number, Email)
            OrderPlacedEvent orderPlacedEvent = new OrderPlacedEvent(order.getOrderNumber(), orderRequest.userDetails().email());
            kafkaTemplate.send("order-placed", orderPlacedEvent);
            log.info("Order placed event: {}", orderPlacedEvent);

        } else {
            throw new RuntimeException("Product with SKU " + orderRequest.skuCode() + " is not in stock");
        }
    }
}
