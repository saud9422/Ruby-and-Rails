📌 MASTER PROMPT (Architecture Context Prompt)

I am building a Hall & Lawn Booking System using:

Backend: Java, Spring Boot, Hibernate, Spring Security (session-based, not JWT)
Frontend: Angular (TypeScript)
Database: MySQL / PostgreSQL
🧠 System Concept

This is a marketplace-style platform like Airbnb/BookMyShow where:

Users can browse and book halls (Consumer role)
Users can also list their halls after upgrading (Hall Owner role)
Admin manages approvals and system control

A single user can have multiple roles:

ROLE_CONSUMER
ROLE_HALLOWNER
ROLE_ADMIN
🏗️ Architecture Rules (IMPORTANT)
User is the central entity
One user per person
No duplicate accounts for different roles
Roles are only for authorization
Roles decide access (not data storage)
Roles are NOT used to store business information
Business data is stored separately
HallOwnerProfile stores owner-specific data
Hall stores hall details
Booking stores reservations
Relationships are handled using foreign keys
User ↔ HallOwnerProfile (One-to-One)
HallOwnerProfile ↔ Hall (One-to-Many)
User ↔ Booking (One-to-Many)
Hall ↔ Booking (One-to-Many)
No inheritance between User types
Do NOT use Consumer extends User or HallOwner extends User
Use composition + roles instead
🔐 Authentication Flow
Spring Security handles login (session-based)
After login, frontend calls /api/auth/me
Backend returns:
user info
roles

Frontend uses roles to:

Show/hide UI elements
Route users to dashboards
📊 Core Entities
User (id, name, email, password, roles)
HallOwnerProfile (id, user_id, business details)
Hall (id, owner_id, hall details)
Booking (id, user_id, hall_id, status, date)
Payment (id, booking_id, status)
Review (id, user_id, hall_id, rating)
🔄 Role Upgrade Flow

When a user becomes a hall owner:

User keeps ROLE_CONSUMER
ROLE_HALLOWNER is added to user
HallOwnerProfile is created
User can now access owner dashboard
🧭 Frontend Rules (Angular)
/me API is the single source of truth
Roles are stored in AuthService
Route guards protect owner/admin routes
UI is dynamically rendered based on roles

Example:

If ROLE_HALLOWNER → show Owner Dashboard
If ROLE_CONSUMER → show Booking features
📌 Backend Security Rules
/api/owner/** → ROLE_HALLOWNER
/api/consumer/** → ROLE_CONSUMER
/api/admin/** → ROLE_ADMIN

Even if frontend is bypassed, backend must block unauthorized access.

🧩 Goal

Design should follow:

Marketplace architecture (Airbnb-like)
Scalable role system
Clean separation of authentication and business data
Proper JPA relationships (no data duplication)
Secure REST APIs with Spring Security

If I ask anything related to this project, assume this architecture as the base context and guide me accordingly.

If you want, I can also convert this into:

📄 PDF documentation (TRD file)
🧱 Spring Boot project folder structure
🗺️ Complete system design diagram (like interview-ready architecture sheet)
i want prompt short and clean 

Here’s a short and clean reusable prompt:

📌 Architecture Context Prompt (Short)

I am building a Hall & Lawn Booking System using Spring Boot (Java), Hibernate, Spring Security (session-based) and Angular.

The system is a marketplace like Airbnb where:

One user can have multiple roles: ROLE_CONSUMER, ROLE_HALLOWNER, ROLE_ADMIN
Roles are only for authorization, not for storing business data
User is the central entity (no separate Consumer/HallOwner accounts)
Business data is stored using separate entities:
HallOwnerProfile (linked to User via One-to-One)
Hall (One-to-Many with HallOwnerProfile)
Booking (links User and Hall)

Authentication flow:

Spring Security login (session-based)
Frontend calls /api/auth/me to get user + roles
Angular uses roles for UI rendering and route guards

Security rules:

/api/owner/** → HALLOWNER
/api/consumer/** → CONSUMER
/api/admin/** → ADMIN

Frontend shows dashboards based on roles, backend enforces access control.