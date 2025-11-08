 Kiosk Manager

A comprehensive system to **manage kiosks**, track sales, inventory, and staff activity, while providing real-time reporting and analytics for business owners.

---

## 🎯 Purpose
Kiosk Manager is designed to help businesses efficiently manage **multiple kiosk outlets**, handle **inventory**, track **daily sales**, and generate **accurate reports**.  
It allows managers to **monitor performance**, streamline operations, and make informed decisions based on real-time data.

---

Video Demo: https://www.linkedin.com/posts/allan-murimi-47852b263_flutter-riverpod-firebase-activity-7390860004666368000-T0wn?utm_source=share&utm_medium=member_desktop&rcm=ACoAAECvGtwB8TRqHr8eImd-FD_lcYL6JxfAHOo 

## 🛠 Features

### 🏬 Kiosk & Inventory Management
- Add and manage multiple kiosks and locations
- Track product inventory per kiosk
- Automatic notifications for low stock or expired items
- Category-based product management

### 💰 Sales & Transactions
- Record sales and receipts in real-time
- Track cash, card, or mobile payments
- Generate daily, weekly, and monthly sales summaries
- Support for promotions, discounts, and offers

### 📊 Reporting & Analytics
- Dashboard with key performance indicators (KPIs)
- Graphical reports for sales, inventory, and revenue trends
- Export data to Excel or CSV for offline analysis
- Detailed transaction history per kiosk or product

### 👤 Staff & User Management
- Role-based access: Admin, Manager, Clerk
- Track employee performance and activities
- Manage shifts and permissions

### 🔒 Security & Permissions
- Secure login and authentication
- Role-based access control
- Data privacy per kiosk and user

---

## ⚡ Technology Stack
- Frontend: Flutter (for kiosk app or mobile management) 
- Backend: Firebase 
- Database: Firebase Firestore
- Authentication: Firebase Authentication 
- State Management (if Flutter): Riverpod
- Reporting & Export: Excel export

---

## 🚀 Installation / Setup

1. Clone the repository:
```bash
git clone https://github.com/yourusername/kiosk-manager.git
cd kiosk-manager
Install dependencies:

bash
Copy code
# Laravel backend
composer install

# Flutter frontend
flutter pub get
Configure environment:

bash
Copy code
cp .env.example .env
Set database credentials

Set Firebase keys (if using Firebase)

Configure other app-specific settings

Run migrations and seed data:

bash
Copy code
php artisan migrate --seed
Start the app:

bash
Copy code
# Backend
php artisan serve

# Flutter (frontend)
flutter run
📂 Project Structure
graphql
Copy code
backend/                  # Laravel backend (if used)
├─ app/
│  ├─ Http/Controllers/   # API and web controllers
│  ├─ Models/             # Eloquent models
├─ database/              # Migrations & seeders
frontend/                 # Flutter app
├─ lib/
│  ├─ models/             # Data models
│  ├─ providers/          # Riverpod providers
│  ├─ screens/            # UI screens
│  ├─ widgets/            # Reusable widgets
📸 Screenshots / Demo
(Add screenshots of dashboards, sales reports, inventory management, and kiosk screens here)

🤝 Contributing
Fork the repository

Create your feature branch (git checkout -b feature/new-feature)

Commit your changes (git commit -m 'Add new feature')

Push to branch (git push origin feature/new-feature)

Open a Pull Request

📫 Contact
Developer: Allan Murimi

Email: your.email@example.com

LinkedIn: Allan Murimi

⚡ Key Benefits
Streamlines kiosk operations and inventory tracking

Provides real-time sales analytics and reporting

Supports multi-user management with role-based permissions

Allows business owners to make informed decisions quickly

Exportable data ensures easy accounting and compliance

