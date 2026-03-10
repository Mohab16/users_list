# Flutter Users List App 🚀

A modern, scalable Flutter application demonstrating clean architecture, advanced state management, and infinite scroll pagination. This app fetches a list of users from a remote API, handles authentication (Login & Verification), and perfectly displays data using a beautifully skeletonized UI.

## 📱 Features
* **Authentication Flow**: Secure login and email PIN verification screens.
* **Infinite Scroll Pagination**: Efficiently loads and displays users in batches as the user scrolls, saving network and memory resources.
* **Skeleton Loading**: Beautiful loading placeholder animations using `skeletonizer` to prevent layout shift.
* **Clean Architecture**: Strictly organized by features (`login`, `home`) and layers (`ui`, `logic`, `data`, `core`) for high testability and maintainability.
* **Modern UI/UX**: Custom themed widgets, responsive sizing using `flutter_screenutil`, and dynamic error handling.

## 🛠 Tech Stack & Packages
* **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
* **Networking**: [dio](https://pub.dev/packages/dio) & [retrofit](https://pub.dev/packages/retrofit)
* **Dependency Injection**: [get_it](https://pub.dev/packages/get_it)
* **Pagination**: [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination) (v5+)
* **Data classes & JSON**: [freezed](https://pub.dev/packages/freezed) & json_serializable
* **Responsive UI**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
* **UI Skeletons**: [skeletonizer](https://pub.dev/packages/skeletonizer)
* **Pin Input**: [pinput](https://pub.dev/packages/pinput)

## 🏗️ Folder Structure
```text
lib/
├── core/
│   ├── di/                 # Dependency injection (GetIt setup)
│   ├── helpers/            # Regex, Spacing, and Extensions
│   ├── networking/         # DioFactory, ApiService (Retrofit), Results & Error Handlers
│   ├── routing/            # AppRouter and Route definitions
│   └── theme/              # Colors, Fonts, TextStyles
├── features/
│   ├── home/
│   │   ├── data/           # Models, Repositories (UsersRepo)
│   │   ├── logic/          # UsersCubit, UsersState (Freezed)
│   │   └── ui/             # HomeScreen, UserDetailsScreen, CustomListTile, UsersSkeleton
│   └── login/
│       ├── data/           # Auth Models & Repositories
│       ├── logic/          # LoginCubit, VerifyCubit
│       └── ui/             # LoginScreen, VerificationScreen, custom widgets
└── main.dart
```

## 🚀 Getting Started

### Prerequisites
* Flutter SDK (`^3.8.1` or compatible)
* Dart SDK
* An IDE (VS Code, Android Studio, IntelliJ)

### Installation
1. Clone the repository:
```bash
git clone <your-repository-url>
```

2. Navigate to the project directory:
```bash
cd users_list
```

3. Install dependencies:
```bash
flutter pub get
```

4. Generate the required files (Freezed, JSON Serializable, Retrofit):
```bash
dart run build_runner build --delete-conflicting-outputs
```

5. Run the app:
```bash
flutter run
```

## 🎨 UI Showcase
*(You can drop your app screenshots here! Create an `/assets/screenshots/` folder in your repo and link them like this:)*
- `![Login Screen](assets/screenshots/login.png)`
- `![Verification Screen](assets/screenshots/verify.png)`
- `![Home Screen](assets/screenshots/home.png)`
- `![Details Screen](assets/screenshots/details.png)`

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 📝 License
This project is open source and available under the [MIT License](LICENSE).
