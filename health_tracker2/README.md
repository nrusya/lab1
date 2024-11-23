# Crypto Wallet Application

**Lab Work #2: Creating Custom Widgets in Flutter for a Crypto Wallet Application**

This project is a simplified version of a **Crypto Wallet**, inspired by **Trust Wallet**, developed using Flutter. The app features custom reusable widgets and provides adaptivity to different screen sizes. 

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Navigation Setup](#navigation-setup)
- [How to Run](#how-to-run)
---

## Overview

This project aims to create a basic **Crypto Wallet** application using Flutter while focusing on:
- Creating reusable widgets.
- Implementing proper navigation between screens.
- Ensuring the app is adaptive to different screen sizes.

### Technologies Used:
- **Flutter**
- **Dart**
- **Flutter SVG**
- **Provider**

---

## Project Structure

```plaintext
lib/
├── main.dart
├── routes.dart
├── screens/
│   ├── login_screen.dart
│   ├── registration_screen.dart
│   ├── profile_screen.dart
│   └── main_wallet_screen.dart
├── widgets/
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   ├── crypto_card.dart
│   └── logo_widget.dart
└── models/
    └── crypto_currency.dart
```

---

## Screens

### Login Screen
- This screen allows users to enter their credentials to log in.
- Widgets used: `LogoWidget`, `CustomTextField`, `CustomButton`.

### Registration Screen
- New users can create an account by entering a username, email, and password.
- Widgets used: `LogoWidget`, `CustomTextField`, `CustomButton`.

### User Profile Screen
- Displays the user’s basic information, linked wallets, and an option to edit their profile.
- Widgets used: `CustomButton`.

### Main Wallet Screen
- Displays the total wallet balance and a list of cryptocurrencies.
- Widgets used: `CryptoCard`, `CustomButton`.


## Navigation Setup

The app uses Flutter's built-in navigation system to move between different screens.

- **File**: `lib/routes.dart`

```dart
final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegistrationScreen(),
  '/profile': (context) => ProfileScreen(),
  '/main': (context) => MainWalletScreen(),
};
```

---

## How to Run

### Prerequisites
- Install **Flutter SDK**: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Install **Dart SDK** (if not included in your Flutter installation).

### Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/maksitox/poliuha_flutter_iot.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd crypto_wallet
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run the app**:
   ```bash
   flutter run
   ```

---

## Code Quality

### Linter
This project uses Flutter's built-in linter to ensure code quality.

- Run the following command to check for issues:
  ```bash
  flutter analyze
  ```

- Follow the provided warnings to maintain clean and maintainable code.
