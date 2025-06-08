# Spotify Clone

A modern Flutter application that replicates the core features of Spotify, built with clean architecture principles and modern state management.

## 🎥 Demo Video

[![Watch the demo]](https://drive.google.com/file/d/1inlxgmXWRnmBQ8BcTbVuGTu3evXDQpK4/view?usp=drive_link)

---
## 🚀 Features

- Music streaming interface
- User authentication
- Playlist management
- Search functionality
- Responsive design
- Cross-platform support (iOS, Android, Web)

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: Flutter Bloc
- **Backend**: Supabase
- **Local Storage**: Hydrated Bloc
- **Dependency Injection**: Get It
- **Audio Player**: Just Audio
- **Image Caching**: Cached Network Image
- **Environment Variables**: Flutter Dotenv
- **UI Components**: Flutter Screenutil
- **Vector Graphics**: Flutter SVG

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_svg: latest
  flutter_screenutil: ^5.9.3
  hydrated_bloc: ^10.0.0
  flutter_bloc: latest
  path_provider: latest
  get_it: ^8.0.3
  dartz: ^0.10.1
  supabase_flutter: latest
  flutter_dotenv: ^5.2.1
  cached_network_image: ^3.4.1
  just_audio: latest
```

## 🏗️ Project Structure

```
lib/
├── common/         # Shared utilities and widgets
├── core/          # Core functionality and constants
├── data/          # Data layer (repositories, data sources)
├── domain/        # Business logic and entities
├── presentation/  # UI layer (screens, widgets)
└── main.dart      # Application entry point
```

## 🚀 Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/spotify-clone.git
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Set up environment variables**

   - Create a `.env` file in the root directory
   - Add your Supabase credentials and other configuration

4. **Run the app**
   ```bash
   flutter run
   ```

## 🔧 Configuration

The app uses environment variables for configuration. Create a `.env` file with the following variables:

```env
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
