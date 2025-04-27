# Snowcast

A Flutter application that provides real-time weather information and webcam feeds for ski resorts and mountain locations.

## Features

- **Weather Information**
  - Real-time weather data for both top and bottom altitudes of mountains
  - Detailed weather metrics including temperature, precipitation, wind speed, UV index, and fog conditions
  - Weather status indicators with appropriate color coding

- **Mountain Selection**
  - Dropdown menu for selecting different mountain locations
  - Automatic weather updates when changing locations

- **Webcam Integration**
  - Live webcam feeds from selected mountain locations
  - Loading and error states for webcam streams

- **Snow Notifications** (Work in Progress)
  - Stay informed about snow conditions and updates

## Project Structure

```
lib/
├── core/                 # Core functionality and utilities
│   ├── extensions/      # Dart extensions
│   ├── navigation/      # Navigation components
│   └── router/          # Route configuration
├── features/            # Feature modules
│   ├── mountain_selector/  # Mountain selection functionality
│   ├── weather/         # Weather information feature
│   ├── webcam/          # Webcam integration
│   └── snow_notifications/ # Snow condition notifications
└── main.dart            # Application entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (^3.5.0)
- Dart SDK (^3.5.0)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/snowcast.git
   ```

2. Navigate to the project directory:
   ```bash
   cd snowcast
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Create a `.env` file in the root directory with your API keys and configuration.

5. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- **State Management**: `flutter_bloc`
- **Routing**: `go_router`
- **Environment Variables**: `flutter_dotenv`
- **Web Integration**: `flutter_inappwebview`
- **HTTP Client**: `http`
- **Code Generation**: `freezed`, `build_runner`

## Development

### Code Generation

Run the following command to generate code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### App Icons

To update app icons:
```bash
flutter pub run flutter_launcher_icons
```

## Acknowledgments

- Weather data provided by [MET Norway](https://api.met.no/)
- Webcam feeds provided by:
  - Jahorina: [jahorina.org](https://www.jahorina.org)
  - Kopaonik: [infokop.net](https://m.infokop.net)
  - Zlatibor: [uzivokamere.com](https://uzivokamere.com)
  - Bansko: [banskoski.com](https://www.banskoski.com)
  - Stara Planina: [skiresort.info](https://www.skiresort.info)
  - Val Thorens: [valthorens.com](https://www.valthorens.com)
  - Les 2 Alpes: [les2alpes.com](https://www.les2alpes.com)
  - Cortina d'Ampezzo: [dolomitisuperski.com](https://www.dolomitisuperski.com)
