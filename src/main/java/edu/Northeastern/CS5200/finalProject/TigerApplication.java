package edu.Northeastern.CS5200.finalProject;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

/**
 * @version 1.0
 * @since JDK8
 */
@Slf4j
@SpringBootApplication
@ServletComponentScan  // 扫描 Servlet、Filter、Listener 确保过滤器生效
public class TigerApplication {
    public static void main(String[] args) {
        SpringApplication.run(TigerApplication.class, args);
        log.info("Project started successfully! [Tiger Takeaway]");
        log.info("Backend management system: http://localhost:8080/backend/index.html");
        log.info("Frontend service page: http://localhost:8080/front/index.html");
    }
}
