package com.rohit.microservices.product.service;

import com.rohit.microservices.product.dto.ProductRequest;
import com.rohit.microservices.product.dto.ProductResponse;
import com.rohit.microservices.product.model.Product;
import com.rohit.microservices.product.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {
    private final ProductRepository productRepository;

    public ProductResponse createProduct(ProductRequest productRequest) {
        // Logic to create a product will go here
        Product product = Product.builder()
                .name(productRequest.name())
                .description(productRequest.description())
                .price(productRequest.price())
                .build();
        productRepository.save(product);
        log.info("Product created successfully: {}", product.getId());

        return new ProductResponse(product.getId(), product.getName(), product.getDescription(), product.getPrice());
    }

    public List<ProductResponse> getAllProducts() {
        return productRepository.findAll().stream().map(product -> new ProductResponse(
                product.getId(),
                product.getName(),
                product.getDescription(),
                product.getPrice()
        )).toList();
    }

    public ProductResponse getProduct(String id) {
        Product product = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));
        return new ProductResponse(product.getId(), product.getName(), product.getDescription(), product.getPrice());
    }
}
