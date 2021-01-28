package com.ri4.datastudio;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class DataStudioApplication {

    public static void main(String[] args) {
        SpringApplication.run(DataStudioApplication.class, args);
    }

}
