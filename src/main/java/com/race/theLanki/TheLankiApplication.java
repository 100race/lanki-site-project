package com.race.theLanki;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.race.*"})
public class TheLankiApplication {

	public static void main(String[] args) {
		SpringApplication.run(TheLankiApplication.class, args);
	}

}
