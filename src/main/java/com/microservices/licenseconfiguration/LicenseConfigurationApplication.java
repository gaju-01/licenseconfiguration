package com.microservices.licenseconfiguration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class LicenseConfigurationApplication {

	public static void main(String[] args) {
		SpringApplication.run(LicenseConfigurationApplication.class, args);
	}

}
