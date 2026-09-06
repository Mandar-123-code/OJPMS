# OJPMS - Online Job Portal Management System

## 📌 Project Overview

OJPMS (Online Job Portal Management System) is a Java-based web application developed to simplify the recruitment process by connecting job seekers and employers on a single platform.

The application enables employers to post job opportunities, while candidates can register, search for jobs, and apply online. It provides a secure and user-friendly interface for managing the complete hiring workflow.

---

## 🚀 Features

### Candidate Module

- User Registration
- Secure Login & Logout
- Update Profile
- Search Jobs
- Apply for Jobs
- View Applied Jobs

### Employer Module

- Employer Registration
- Employer Login
- Add New Job
- Update Job Details
- Delete Job Posts
- View Applicants

### Admin Module

- Manage Users
- Manage Employers
- Manage Job Listings
- Monitor System Activities

---

## 🛠️ Technologies Used

| Technology      | Purpose                                        |
| --------------- | ---------------------------------------------- |
| Java 25         | Runtime and language                           |
| Spring Boot 3.5 | Application runtime                            |
| Spring Web      | REST API                                       |
| Spring Data JPA | Repository-based persistence                   |
| Spring Security | BCrypt passwords and HTTP Basic authentication |
| PostgreSQL      | Database                                       |
| Maven           | Dependency management and packaging            |

---

## 📁 Project Structure

```
OJPMS
│── src
│   └── main
│       ├── java
│       └── resources
│
├── pom.xml
├── .gitignore
├── .classpath
└── .project
```

---

## ⚙️ Prerequisites

Before running the project, install the following:

- Java JDK 25
- Apache Maven
- PostgreSQL with a database named `ojpms`

---

## 🗄️ Database Configuration

1. Create a PostgreSQL database named `ojpms`.
2. Ensure the `postgres` user has password `root`, or set `DB_USERNAME` and `DB_PASSWORD` environment variables.
3. The application creates and updates tables with Hibernate using `spring.jpa.hibernate.ddl-auto=update`.

The default connection is:

- URL: `jdbc:postgresql://localhost:5432/ojpms`
- Username: `postgres`
- Password: `root`

---

## ▶️ How to Run the Project

### Run the REST API

```bash
mvn spring-boot:run
```

The API starts on `http://localhost:8080`.

### API overview

- `POST /api/auth/register` creates a USER or RECRUITER account.
- `GET /api/auth/me` returns the authenticated account.
- `GET /api/jobs` and `GET /api/jobs/{id}` are public.
- Recruiters use authenticated `POST`, `PUT`, `DELETE`, and `GET /api/jobs/mine` operations.
- Candidates use authenticated `/api/applications` and `/api/saved-jobs` operations.
- Protected endpoints use HTTP Basic authentication with the registered email and password.

---

## 📷 Screenshots

<img width="1536" height="863" alt="image" src="https://github.com/user-attachments/assets/c26328a9-0e4a-4d18-b088-15a49bc981f8" />
<img width="1536" height="863" alt="image" src="https://github.com/user-attachments/assets/a877c3e7-8e7f-47cc-8a1e-8c15dbb03bd9" />
<img width="1536" height="863" alt="image" src="https://github.com/user-attachments/assets/284b5e00-dbd6-48f5-bf85-50d64561c42d" />
<img width="1536" height="863" alt="image" src="https://github.com/user-attachments/assets/f0e0f771-0f94-4e3e-8f4b-df4a95c02fa0" />

## 📌 Future Enhancements

- Resume Upload
- Email Notifications
- OTP Verification
- Advanced Job Filtering
- Admin Analytics Dashboard
- JWT authentication
- Resume upload

---

## 👨‍💻 Developer

**Mandar Kulkarni**

- Java Full Stack Developer
- MERN Stack Developer
- Electronics and Telecommunications Engineering (ENTC)

---

## 📄 License

This project is developed for educational and learning purposes.
