package com.rohit.microservices.product;

import io.restassured.RestAssured;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.context.annotation.Import;
import org.testcontainers.mongodb.MongoDBContainer;

@Import(TestcontainersConfiguration.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class ProductServiceApplicationTests {

    @ServiceConnection
    static MongoDBContainer mongoDBContainer = new MongoDBContainer("mongo:7.0.5");

    @LocalServerPort
    private Integer port;

    @BeforeEach
    void setUp() {
        RestAssured.baseURI = "http://localhost";
        RestAssured.port = port;

    }

    static {
        mongoDBContainer.start();
    }

    @Test
    void shouldCreateProduct() {

        // Implement test logic to create a product using RestAssured
        String requestBody = """
                {
                    "name": "iPhone 16",
                    "description": "iPhone 16 is the second brand new series of latest smartphone from Apple",
                    "price": 71000
                }
                """;

        RestAssured.given()
                .header("Content-Type", "application/json")
                .body(requestBody)
                .when()
                .post("/api/product")
                .then()
                .statusCode(201)
                .body("id", Matchers.notNullValue())
                .body("name", Matchers.equalTo("iPhone 16"))
				.body("description", Matchers.equalTo("iPhone 16 is the second brand new series of latest smartphone from Apple"))
                .body("price", Matchers.equalTo(71000));

    }

}
