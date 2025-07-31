# Stackfood

Stackfood is a food delivery app built with Flutter. It allows users to browse restaurants, view menus, and place orders.

## Project Setup

### Prerequisites

*   Flutter: 3.32.7
*   Dart: 3.8.1

### Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/srksifat-dev/stackfood.git
    ```

2.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run the app:**

    ```bash
    flutter run
    ```

## Features

*   Browse restaurants
*   View menus
*   View Categories
*   View Popular Menus



# StackFood Flutter App

A Flutter application that displays a comprehensive list of restaurants, food categories, and popular food items using the public StackFood API. This project demonstrates clean architecture principles and modern Flutter development practices.

## 📱 Features

- Browse restaurants with pagination support
- Explore food categories
- Discover popular food items
- View food campaigns and banners
- Clean, intuitive user interface
- Cross-platform support (iOS, Android, Web)

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

### Data Layer
- **Data Sources**: Handles API communication with StackFood API
- **Repositories**: Implements domain repository contracts and manages data flow
- **Models**: Data transfer objects and API response models

### Domain Layer
- **Entities**: Core business objects
- **Repositories**: Abstract contracts for data operations
- **Use Cases**: Business logic implementations

### Presentation Layer
- **Widgets**: Reusable UI components (RestaurantCard, CategoryCard, etc.)
- **Views**: Screen-level UI implementations
- **Cubits/BLoCs**: State management using BLoC pattern

## 🚀 Getting Started

### Prerequisites

Before running this project, ensure you have the following installed:

- **Flutter SDK** 3.32.7
- **Dart** 3.8.1
- **Android Studio** or **Visual Studio Code** with Flutter plugins
- **Xcode** (for iOS development on macOS)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/srksifat-dev/stackfood.git
   ```

2. **Navigate to project directory**
   ```bash
   cd stackfood
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   
   For mobile devices:
   ```bash
   flutter run
   ```
   
   For web browser:
   ```bash
   flutter run -d chrome --web-renderer html
   ```

5. **Build for production**
   
   Android APK:
   ```bash
   flutter build apk --release
   ```
   
   The APK will be generated in `build/app/outputs/flutter-apk/` directory.

## 🌐 API Integration

The app integrates with the StackFood public API:

### Base URL
```
https://stackfood-admin.6amtech.com
```

### Endpoints Used
- **Configuration**: `/api/v1/config` - Fetches app configuration and image base URL
- **Banners**: `/api/v1/banners` - Promotional banners
- **Categories**: `/api/v1/categories` - Food categories
- **Popular Foods**: `/api/v1/products/popular` - Trending food items
- **Food Campaigns**: `/api/v1/campaigns/item` - Special campaigns
- **Restaurants**: `/api/v1/restaurants/get-restaurants/all?offset=1&limit=10` - Restaurant listings (paginated)

### API Headers
All API requests include the following headers:
```json
{
  "Content-Type": "application/json; charset=UTF-8",
  "zoneId": "[1]",
  "latitude": "23.735129",
  "longitude": "90.425614"
}
```

## 📁 Project Structure

```
lib/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── cubits/
│   ├── views/
│   └── widgets/
└── main.dart
```

## 🛠️ Built With

- **Flutter** - UI framework
- **Dart** - Programming language
- **BLoC/Cubit** - State management
- **HTTP** - API communication
- **Clean Architecture** - Project structure


## 🔧 Development

### Code Style
This project follows Flutter's official style guide and uses:
- Linting rules for consistent code formatting
- Clean architecture patterns
- BLoC pattern for state management

### Testing
Run tests using:
```bash
flutter test
```
