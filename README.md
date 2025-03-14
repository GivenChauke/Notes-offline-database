# Offline Notes App

A **Flutter** application that allows users to create, update, and delete notes offline using **SQLite** for local storage.

## 📌 Features
- Add, edit, and delete notes.
- Persistent offline storage with SQLite.
- Simple and intuitive UI with Material Design.

## 🛠 Tech Stack
- **Flutter** (Frontend)
- **SQLite (sqflite)** for local database management
- **Path Provider** for managing file storage paths

## 📷 Screenshots
![image](https://github.com/user-attachments/assets/2e71d5e4-f131-48cb-8fa2-bb6c2ae277a3)


## 🚀 Getting Started

### 1️⃣ Prerequisites
Ensure you have Flutter installed. You can check with:
```sh
flutter --version
```
If not installed, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).

### 2️⃣ Clone the Repository
```sh
git clone https://github.com/yourusername/offline-notes-app.git
cd offline-notes-app
```

### 3️⃣ Install Dependencies
```sh
flutter pub get
```

### 4️⃣ Run the App
For Android:
```sh
flutter run
```
For iOS:
```sh
flutter run --no-sound-null-safety
```

## 📂 Project Structure
```
lib/
│── main.dart                 # Entry point of the app
│── models/
│   ├── note_model.dart       # Note data model
│── screens/
│   ├── note_screen.dart      # Main notes screen
│── widgets/
│   ├── note_widget.dart      # UI component for displaying notes
│── services/
│   ├── database_helper.dart  # SQLite database helper
```


## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
**Happy Coding! 🚀**

