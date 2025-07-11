# 📰 Flutter News App

This is a simple and clean Flutter application that fetches and displays news articles using the NewsAPI.org public API.

---

## 📱 Features

- Fetches top headlines from NewsAPI
- Scrollable list of news articles
- Each article shows:
  - 🖼️ Image (with fallback)
  - 🧾 Title
  - 🕒 Published Date
  - 📜 Short Description
- Search bar to filter articles by keywords
- Tap any article to view full details and external link
- Includes loading spinner and error messages

---

## 🔧 Technologies Used

- Flutter
- `http` package for API calls
- `intl` package for date formatting
- State Management: `setState` (simple, no external library)
- NewsAPI.org for data source

---

## 🚀 Getting Started

### ✅ Prerequisites

- Flutter SDK installed
- NewsAPI API key from [https://newsapi.org](https://newsapi.org)

### 🔨 How to Run

```bash
git clone https://github.com/Kezia-debug/flutter-news-app.git
cd flutter-news-app
flutter pub get
flutter run

📱 Screenshots
🏠 Home Screen


📄 Detail Screen


🗂️ Folder Structure
css
Copy
Edit
lib/
├── models/
│   └── news_article.dart
├── screens/
│   ├── home_screen.dart
│   └── news_detail_screen.dart
├── services/
│   └── news_service.dart
├── widgets/
│   ├── news_tile.dart
│   └── search_bar.dart
└── main.dart

