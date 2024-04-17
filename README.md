# Tiger Takeaway

Tiger Takeaway is a web-based food ordering and delivery application built using the Spring Boot, MySQL and Mybatis.

### Build, Install, Config and Run

#### Development & debugging environment

Due to the tight schedule, this project does not have any distribution plans. The following content is for the 
development and debugging environment, which facilitates reproduction.

 - OS: Microsoft Windows 11, x86_64, ver 22631
 - IDE: Jetbrains IntelliJ IDEA 2024.1
 - JDK: Amazon Corretto 1.8.0_402
 - Build tool: Apache Maven 3.9.6
 - Database: MySQL 8.0.36
 - Test browsers: Google Chrome 123.0, Safari 604.1

#### Installation

1. Unzip the code.
2. Run IntelliJ IDEA, choose “Files – Open…”, and locate the “tiger-takeaway” folder. Click “OK”.
3. After importing, you can see a configuration named "TigerApplication" above the IDE. Click the green ▶ key on the 
   right to run it.
4. You may need to let maven download dependencies for the application. Click "Ⓜ️" button on the right and choose 
   "install".

#### Configurations

1. Edit the file "application.yml" in Resources folder in Project column at left side of the IDE.
   (src/main/resources/application.yml)
2. Set application port: edit server.port, default 8080.
3. Set email SMTP authentication: edit spring.mail.host, spring.mail.username, spring.mail.password, spring.mail.port.
4. Import SQL into MySQL server: Execute sql/db.sql and sql/user_tiger_dev.sql in your MySQL server.
5. Set local MySQL authentication: edit spring.datasource.druid.username, spring.datasource.druid.password.

#### Run the application

After you run the application, There should be prompt in the output showing like "Project started successfully! 
   [Tiger Takeaway]" and two addresses for Backend management system and frontend service page.

### Used tools and packages

 - Spring Boot 2.4.5
 - Mybatis-Plus 3.4.2
 - Lombok 1.18.20
 - Fastjson 1.2.76
 - Alibaba Druid 1.1.23