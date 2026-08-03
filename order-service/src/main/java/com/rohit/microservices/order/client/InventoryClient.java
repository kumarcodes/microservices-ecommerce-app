package com.rohit.microservices.order.client;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.GetExchange;


public interface InventoryClient {

    @GetExchange("/api/inventory")
    boolean inStock(@RequestParam String skuCode,@RequestParam Integer quantity);

}
