# Digital Cookbook (Web Application)

This repository contains the full source code, database scripts, and documentation for a "Digital Cookbook" web application. Developed for the **Databases - Interface Programming** course at ETTI, UNSTPB.

## 📖 About the Project
The goal of this project was to design a shared relational database and build two distinct web interfaces to interact with it, utilizing two different Java-based web technologies.

The application allows users to manage a collection of food recipes and their ingredients. It correctly handles complex many-to-many (M:N) relationships (e.g., mapping specific ingredients and their quantities to specific recipes) using JOIN operations.

## ⚙️ Tech Stack & Implementations
The project features two separate implementations sharing a single MySQL database:

### Implementation 1: Java Spring Boot
* **Framework:** Java Spring Boot.
* **Architecture:** MVC (Model-View-Controller).
* **Template Engine:** Thymeleaf.
* **Build Tool:** Maven.

### Implementation 2: Jakarta Server Pages (JSP)
* **Framework:** Jakarta Server Pages (JSP).
* **Logic:** JDBC and JavaBeans.
* **Web Server:** Apache Tomcat.

## ✨ Key Features
* **Full CRUD Operations:** Users can View, Add, Edit, and Delete data across all primary and associative tables directly from the UI.
* **Form Validation:** Basic validations applied directly within the UI to prevent empty submissions.
* **Modular UI:** Custom CSS styling for a clean and consistent visual experience across both applications.

## 📂 Repository Structure
* 📂 `Database/`: Contains the `.sql` script for the EER database schema and table creation.
* 📂 `Spring_Boot_App/`: The complete source code for the Spring Boot implementation.
* 📂 `JSP_App/`: The complete source code for the JSP/Tomcat implementation.
* 📂 `Documentation/`: Comprehensive PDF reports detailing the architecture, entity relationships, and technologies used for both implementations.
