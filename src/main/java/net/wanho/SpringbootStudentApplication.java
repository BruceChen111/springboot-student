package net.wanho;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("net.wanho.mapper")
public class SpringbootStudentApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootStudentApplication.class, args);
	}

}
