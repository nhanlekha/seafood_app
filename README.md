# SeaFood: Full Stack Ecommerce Mobile Application Documentation

SeaFood is a full-stack e-commerce mobile application developed using **Flutter** with Dart for the frontend and **PHP** with MySQL hosted on XAMPP for the backend. The app is designed to provide a seamless online shopping experience for seafood enthusiasts, offering a wide selection of fresh seafood products.

---

## Features

### 1. User Management
- Users can browse, view, and add food to their cart.
- Seamless checkout using Cash on Delivery (COD) or Stripe payment gateway integration.
- Users can create and manage their accounts, view past orders, and update their profiles.
- Account creation, login, and profile picture addition.
- Forgot password feature with OTP-based password reset.
- Users can leave ratings and comments on products they’ve purchased.
- Users can mark products as favorites to easily access and purchase later.
- Users can add, update, and manage multiple delivery addresses for easier checkout.

### 2. Admin Panel
- **Product management**: Add, update, and delete products.
- **Customer Management**: View, edit, and manage customer details and accounts.
- **Slider Management**: Update and manage promotional banners and sliders on the homepage.
- **Category Management**: Create, update, and manage product categories for better organization.
- **Comment Management**: Moderate and manage customer comments and reviews on products.
- **Event Management**: Create and manage discount coupons, flash sales, and promotional offers to boost sales.
- **Shipping Management**: Set up and manage shipping fees based on customer addresses.
- **Order Management**: View, update, and track the status of customer orders.

---

## Technology Stack

### Frontend Libraries
- Dart
- Flutter
- Flutter Material
- Flutter Bloc
- Equatable
- Dio
- Image Picker
- Permission Handler
- Carousel Slider
- Easy Localization

### Backend Libraries
- PHP
- Laravel Framework
- Barryvdh/Laravel-Dompdf
- Bumbummen99/Shoppingcart
- Google/Recaptcha
- GuzzleHTTP/Guzzle
- Laravel/Sanctum
- Laravel/Socialite
- Laravel/Tinker
- Stevebauman/Location

---

## Testing Instructions

### Backend Setup

#### Environment Variables
Ensure the following environment variables are set for the backend:
- `APP_NAME`
- `APP_ENV`
- `APP_KEY`
- `APP_DEBUG`
- `APP_URL`
- `HOST_API`
- `DB_CONNECTION`
- `DB_HOST`
- `DB_PORT`
- `DB_DATABASE`
- `DB_USERNAME`
- `DB_PASSWORD`
- `CACHE_DRIVER`
- `SESSION_DRIVER`
- `QUEUE_CONNECTION`
- `REDIS_HOST`
- `REDIS_PASSWORD`
- `REDIS_PORT`
- `MAIL_MAILER`
- `MAIL_HOST`
- `MAIL_PORT`
- `MAIL_USERNAME`
- `MAIL_PASSWORD`
- `MAIL_ENCRYPTION`
- `MAIL_FROM_ADDRESS`
- `MAIL_FROM_NAME`
- `CAPTCHA_KEY`
- `CAPTCHA_SECRET`
- `FACEBOOK_APP_ID`
- `FACEBOOK_APP_SECRET`
- `FACEBOOK_REDIRECT`
- `GOOGLE_ID`
- `GOOGLE_SECRET`
- `GOOGLE_URL`
- `PUSHER_APP_ID`
- `PUSHER_APP_KEY`
- `PUSHER_APP_SECRET`
- `PUSHER_HOST`
- `PUSHER_PORT`
- `PUSHER_SCHEME`
- `PUSHER_APP_CLUSTER`

> **Note**:
> - If the backend is running locally, use the IPv4 address instead of `localhost`. You can find the IPv4 Address by typing `ipconfig` in the command prompt.
> - Modify the server link to your server link followed by `/DoAnCNWeb/api/`, e.g., `http://192.168.1.6/DoAnCNWeb/api/`.

---

### Starting the Frontend
1. Navigate to the `mobile` directory.
2. Run `flutter pub get` to install dependencies.
3. Initiate the application by opening the project in Android Studio and clicking **Run** or using the command `flutter run`.

---

### Starting the Backend
1. Start XAMPP and ensure **Apache** and **MySQL** are running.
2. Open your browser and go to the following URL to access phpMyAdmin:
   - [http://localhost/phpmyadmin/index.php](http://localhost/phpmyadmin/index.php)
3. Import your database file into a new database named `seafood`:
   - Create a new database named `seafood`.
   - After creating the database, click on the **Import** tab.
   - Choose your database file (usually `.sql`) and click **Go** to import it.
4. Once the import is complete, navigate to the following URL to view and manage the structure of the `seafood` database:
   - [http://localhost/phpmyadmin/index.php?route=/database/structure&db=seafood](http://localhost/phpmyadmin/index.php?route=/database/structure&db=seafood)

> **Important**: Ensure that the backend environment variables are properly set before running the backend server.

---

## Postman API Documentation
Explore the backend API documentation through Postman using the provided link below:
- **Postman API Documentation**

Set the Postman environment variable `network` to e.g., `http://192.168.1.6/DoAnCNWeb/api/`.

---

This documentation provides an overview of the SeaFood application, its features, technology stack, and setup instructions for both frontend and backend. For further development or testing, refer to this guide and ensure the necessary dependencies and configurations are in place.
