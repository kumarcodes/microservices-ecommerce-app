package com.rohit.microservices.gateway.config;

import io.github.resilience4j.circuitbreaker.CircuitBreaker;
import io.github.resilience4j.circuitbreaker.CircuitBreakerRegistry;
import jakarta.annotation.PostConstruct;
import org.springframework.boot.health.contributor.Health;
import org.springframework.boot.health.contributor.HealthIndicator;
import org.springframework.boot.health.contributor.Status;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Configuration
public class Resilience4jConfig {

    private final CircuitBreakerRegistry circuitBreakerRegistry;

    public Resilience4jConfig(CircuitBreakerRegistry circuitBreakerRegistry) {
        this.circuitBreakerRegistry = circuitBreakerRegistry;
    }

    @PostConstruct
    public void registerCircuitBreakers() {
        List<String> breakerNames = List.of(
                "productServiceCircuitBreaker",
                "productServiceSwaggerCircuitBreaker",
                "orderServiceCircuitBreaker",
                "orderServiceSwaggerCircuitBreaker",
                "inventoryServiceCircuitBreaker",
                "inventoryServiceSwaggerCircuitBreaker"
        );

        for (String breakerName : breakerNames) {
            circuitBreakerRegistry.circuitBreaker(breakerName);
        }
    }

    @Bean
    public HealthIndicator circuitBreakersHealthIndicator() {
        return () -> {
            Map<String, String> breakerStates = new LinkedHashMap<>();
            for (CircuitBreaker breaker : circuitBreakerRegistry.getAllCircuitBreakers()) {
                breakerStates.put(breaker.getName(), breaker.getState().name());
            }

            boolean allClosed = breakerStates.values().stream().allMatch(state -> "CLOSED".equalsIgnoreCase(state));
            return Health.status(allClosed ? Status.UP : Status.DOWN)
                    .withDetails(breakerStates)
                    .build();
        };
    }
}
