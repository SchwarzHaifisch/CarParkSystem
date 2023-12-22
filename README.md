**Car Park System Spring Boot 3.0 with SQL Databases**

This project demonstrates the implementation of security using Spring Boot 3.0 and full form system for parking reservations.

**Features**

- Client reservation with full validation
- Admin (worker) login page
- Role-based authentication with Spring Security
- Logout mechanism
- Page for the client and page for the admin/worker

On admin page:

- Reservation confirming/rejecting/editing and marking when client go to the parking and when client go out
- Full reservation history without any possibility of editing 
- Tax invoices automat 
- Sending information emails to clients after confirmation/rejection etc.

On client page:

- Forms to create reservation
- Payment method chose
- Contact page with location
- Price list

**Technologies**

- Spring Boot 3.0
- Spring Security
- JSP
- JS
- BCrypt
- Maven
- SQL

**Getting Started**

To get started with this project, you have to have this points installed on your machine:

- JDK 17+
- Maven 3+

To build project:

- Clone the repository: git clone https://github.com/SchwarzHaifisch/CarParkSystem.git
- Find the project
- Create database: parkingReseravtionSystem
- Change login and password to database in application.propeties
- Build the project: mvn clean install
- Run the project

The system will be available at https://localhost:8080
