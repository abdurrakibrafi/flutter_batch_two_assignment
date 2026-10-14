# 📱 Flutter Batch 02 — Daily Classes & Assignments

Welcome to the **Flutter Batch 02** learning repository! 🚀

This repository is created for students who are learning Flutter application development from beginner to advanced levels.

Here, you will find **daily class source code, practical examples, Flutter widget implementations, assignments, and learning resources**.

The main goal is to help students understand Flutter development through hands-on practice and real-world examples.

---

## 📚 About This Repository

**Project Name:** `flutter_batch_two_assignment`

**Framework:** Flutter  
**Programming Language:** Dart  
**Course:** Flutter Batch 02  
**Level:** Beginner to Intermediate  
**Development Tools:** VS Code / Android Studio / Xcode

### 🎯 Learning Objectives

By following this repository, students will learn:

- Dart programming fundamentals
- Flutter project structure
- Flutter widgets and layouts
- StatelessWidget and StatefulWidget
- Material Design components
- Navigation between screens
- Working with images, icons, and fonts
- Button actions and user interactions
- Forms and input validation
- API integration and JSON handling
- State management fundamentals
- Building complete Flutter applications

---

## 📂 Flutter Project Structure

A typical Flutter project contains the following files and folders:

```text
flutter_batch_two_assignment/
│
├── android/                 # Android configuration
├── ios/                     # iOS configuration
├── lib/                     # Main Flutter source code
│   ├── main.dart            # Application entry point
│   │
│   ├── screens/             # Application screens
│   │   └── home_screen.dart
│   │
│   └── widgets/             # Reusable widgets
│
├── assets/                  # Images, fonts, and other assets
│   └── images/
│
├── test/                    # Automated tests
├── web/                     # Web configuration
├── pubspec.yaml             # Dependencies and assets
├── pubspec.lock             # Locked dependency versions
└── README.md                # Project documentation
```

**Important:** Some folders, such as `screens/`, `widgets/`, and `assets/`, may need to be created manually. Other platform folders depend on which platforms were enabled when the project was created.

### Important Files Explained

| File / Folder | Description |
|---|---|
| `lib/` | Contains Flutter application code |
| `main.dart` | Starting point of the application |
| `screens/` | Contains different application screens |
| `widgets/` | Contains reusable UI components |
| `assets/` | Stores local images and resources |
| `pubspec.yaml` | Manages packages, assets, and project settings |
| `android/` | Android platform configuration |
| `ios/` | iOS platform configuration |
| `test/` | Contains automated tests |

---

## 🗓️ Daily Class Source Code

This repository will be updated with code examples covered during our Flutter classes.

Students should regularly check the repository for new lessons and assignments.

### Daily Learning Topics

| Class | Topic | Practice |
|---|---|---|
| Day 01 | Flutter Introduction | Project setup and first application |
| Day 02 | Dart Basics | Variables, data types, and functions |
| Day 03 | Scaffold and AppBar | Create a basic screen |
| Day 04 | Text and Styling | Fonts, colors, and text styles |
| Day 05 | Row and Column | Flutter layout design |
| Day 06 | Container and Padding | Spacing and decoration |
| Day 07 | Images and Assets | Network and local images |
| Day 08 | Buttons and Actions | ElevatedButton and user interaction |
| Day 09 | Stateless and Stateful Widgets | Widget lifecycle and state |
| Day 10 | Navigation | Moving between screens |

**Note:** This is a suggested learning outline. Actual class topics and uploaded source code may change based on classroom progress.

---

## 💻 How to Run the Flutter Project

Follow these steps to download and run the application on your computer.

### Step 1: Install Flutter

First, install the Flutter SDK.

Official documentation:

https://docs.flutter.dev/get-started/install

You will also need:

- Flutter SDK
- Dart SDK (included with Flutter)
- VS Code or Android Studio
- Android Emulator or a physical device
- Xcode (for iOS development on macOS)

### Step 2: Check Flutter Installation

Open your terminal and run:

```bash
flutter doctor
```

This command checks your Flutter development environment.

Fix any reported setup problems required for your target platform.

### Step 3: Clone the Repository

Open your terminal and run:

```bash
git clone <repository-url>
```

Replace `<repository-url>` with the GitHub repository's actual clone URL.

Then navigate into the project:

```bash
cd flutter_batch_two_assignment
```

Alternatively, download the ZIP file from GitHub and extract it.

### Step 4: Install Dependencies

Run the following command:

```bash
flutter pub get
```

This downloads all packages listed in `pubspec.yaml`.

### Step 5: Check Available Devices

Run:

```bash
flutter devices
```

This displays connected devices and available development targets.

### Step 6: Run the Flutter Application

Start an Android emulator, iOS simulator, or connect a physical device.

Then execute:

```bash
flutter run
```

To run on a particular device:

```bash
flutter run -d <device-id>
```

You can find the device ID using `flutter devices`.

**Congratulations! 🎉 Your Flutter application should now be running.**

---

## 🧩 Understanding Flutter Code Structure

Flutter applications are built using **widgets**.

Widgets are the building blocks of Flutter applications.

### Example: main.dart

```dart
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Batch 02',

      home: const HomeScreen(),
    );
  }
}
```

### Example: home_screen.dart

```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Batch 02'),
        backgroundColor: Colors.amber,
      ),

      body: const Center(
        child: Text(
          'Welcome to Flutter!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
```

### Code Explanation

| Widget / Function | Purpose |
|---|---|
| `main()` | Entry point of the Dart application |
| `runApp()` | Starts the Flutter application |
| `MaterialApp` | Configures the Material Design application |
| `Scaffold` | Provides the main page layout |
| `AppBar` | Creates the top app bar |
| `Center` | Centers its child widget |
| `Text` | Displays text |
| `StatelessWidget` | Creates a widget without mutable internal state |
| `build()` | Describes the widget's user interface |

### Understanding the Widget Tree

```text
MyApp
 └── MaterialApp
      └── HomeScreen
           └── Scaffold
                ├── AppBar
                │    └── Text
                │
                └── Body
                     └── Center
                          └── Text
```

Flutter uses this hierarchical widget structure to build the user interface.

---

## 🎨 Working with Google Fonts

We will use Google Fonts in some of our class projects.

To install:

```bash
flutter pub add google_fonts
```

Import the package:

```dart
import 'package:google_fonts/google_fonts.dart';
```


Other fonts you can try:

- `GoogleFonts.roboto()`
- `GoogleFonts.lato()`
- `GoogleFonts.montserrat()`
- `GoogleFonts.openSans()`

---

## 🔥 Important Flutter Commands

| Command | Description |
|---|---|
| `flutter doctor` | Checks Flutter installation |
| `flutter create project_name` | Creates a new Flutter project |
| `flutter pub get` | Installs project dependencies |
| `flutter run` | Runs the application |
| `flutter devices` | Lists available devices |
| `flutter clean` | Deletes generated build outputs |
| `flutter analyze` | Analyzes Dart code for issues |
| `flutter test` | Runs automated tests |
| `flutter build apk` | Builds an Android APK |
| `flutter build appbundle` | Builds an Android App Bundle |
| `dart format .` | Formats Dart files |

### Hot Reload and Hot Restart

When using `flutter run` in a supported development session:

**Hot Reload**

Press:

```text
r
```

Updates code changes while preserving most application state.

**Hot Restart**

Press:

```text
R
```

Restarts the Dart application and resets application state.

---

## 📝 Student Assignment Guidelines

Students must complete assignments based on their daily class lessons.

### Assignment Requirements

1. Attend class and understand the explained topics.
2. Download or pull the latest source code.
3. Practice the examples independently.
4. Modify the code to understand widget behavior.
5. Complete the assigned tasks.
6. Test the application before submission.
7. Submit the assignment according to the instructor's instructions.

### Example Assignment: My Favorite Hobby

Create a Flutter screen that contains:

- An AppBar with a title
- A heading showing your favorite hobby
- A short description of your hobby
- A hobby-related image
- An ElevatedButton
- A FloatingActionButton
- Google Fonts for text styling

**Bonus Task:** Show a SnackBar when the user clicks the submit button.

---

## 🔄 How to Get the Latest Class Code

If you have already cloned this repository, open your project terminal.

Run:

```bash
git pull origin main
```

This downloads and integrates the latest changes from the `main` branch.

**Important:** Make sure you save or commit your own changes before pulling new updates. If the repository uses a different branch name, replace `main` accordingly.

Then run:

```bash
flutter pub get
```

This ensures any newly added dependencies are installed.

---

## 🛠️ Common Problems and Solutions

### Problem 1: Flutter Command Not Found

**Solution:** Make sure Flutter is installed and the Flutter SDK's `bin` directory is added to your system PATH.

### Problem 2: No Devices Found

Run:

```bash
flutter devices
```

Start an emulator or connect a physical phone with the required debugging settings enabled.

### Problem 3: Package Not Found

Run:

```bash
flutter pub get
```

### Problem 4: Build Error

First check the error message and run:

```bash
flutter analyze
```

If generated build files are causing problems, try:

```bash
flutter clean
flutter pub get
flutter run
```

### Problem 5: Image Not Loading

Check the following:

- Internet connection
- Image URL
- Android internet permissions, if applicable
- Whether the image server allows access

---

## 📖 Useful Learning Resources

**Official Flutter Documentation**  
https://docs.flutter.dev/

**Dart Programming Documentation**  
https://dart.dev/guides

**Flutter Widget Catalog**  
https://docs.flutter.dev/ui/widgets

**Flutter Cookbook**  
https://docs.flutter.dev/cookbook

**Flutter Packages**  
https://pub.dev/

**Flutter YouTube Channel**  
https://www.youtube.com/@flutterdev

---

## 👨‍🎓 Instructions for Students

This repository is designed to support your daily learning journey.

Remember:

- Practice coding every day.
- Understand the code instead of just copying it.
- Experiment with different Flutter widgets.
- Try solving errors independently.
- Review previous class examples regularly.
- Complete assignments on time.
- Build small projects to improve your skills.

**Consistency and practice are the keys to becoming a successful Flutter developer.**

---

## ⭐ Support This Repository

If this repository helps you learn Flutter, give it a ⭐ on GitHub.

Keep learning, keep practicing, and happy coding! 🚀

**Flutter Batch 02 — Learn • Practice • Build**