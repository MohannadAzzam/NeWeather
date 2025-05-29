# 🌤️ NeWeather

**NeWeather** is a modern Flutter application that provides users with accurate and real-time **weather forecasts** and **news updates**. Designed with a sleek UI and robust architecture using **Cubit state management**, it offers a smooth and intuitive experience for users worldwide.

---

## 📱 Features

- 🌍 **Global City Search** with autocomplete using `SearchDelegate`
- 📍 **Current Location Weather** using latitude and longitude
- ☀️ **Detailed Weather Info** (temperature, condition, humidity, etc.)
- 📰 **Integrated News Feed** (customizable for weather and general news)
- 🔎 **Search Functionality** for any city worldwide
- 🗺️ **Reverse Geolocation** to determine city from GPS
- 🧱 Built with **Bloc/Cubit**, `geolocator`, `http`, and more

---

## 🧰 Tech Stack

| 🛠️ Tool           | 🔍 Description                      |
|------------------|------------------------------------|
| Flutter          | Cross-platform app development     |
| Cubit (Bloc)     | State management                   |
| Geolocator       | Access device location             |
| Geocoding        | Convert coordinates to address     |
| HTTP             | REST API communication             |
| SearchDelegate   | Custom city search UI              |

---

## 📦 Dependencies

The **NeWeather** app is built using a rich set of Flutter packages to ensure performance, design quality, and reliability:

| Package | Description |
|---------|-------------|
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | State management using Cubit/Bloc |
| [`hydrated_bloc`](https://pub.dev/packages/hydrated_bloc) | Persist Cubit/Bloc state locally across sessions |
| [`http`](https://pub.dev/packages/http) | Fetch weather and news data from REST APIs |
| [`geolocator`](https://pub.dev/packages/geolocator) | Access device’s current location (latitude & longitude) |
| [`cached_network_image`](https://pub.dev/packages/cached_network_image) | Display and cache network images efficiently |
| [`google_fonts`](https://pub.dev/packages/google_fonts) | Apply beautiful fonts from Google Fonts |
| [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash) | Show a native splash screen while the app loads |
| [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) | Create custom launcher icons for Android & iOS |
| [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil) | Make the UI responsive on different screen sizes |
| [`rename_app`](https://pub.dev/packages/rename_app) | Easily rename your Flutter app |
| [`path_provider`](https://pub.dev/packages/path_provider) | Get commonly used storage paths (cache, documents, etc.) |
| [`dependency_validator`](https://pub.dev/packages/dependency_validator) | Detect unused or missing dependencies |

### 🧪 Dev Dependencies

These packages assist during development and testing:

- [`flutter_test`](https://pub.dev/packages/flutter_test)
- [`flutter_lints`](https://pub.dev/packages/flutter_lints)
- [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons)
- [`dependency_validator`](https://pub.dev/packages/dependency_validator)

---

## 📸 Screenshots

| 📰 News | 🗞️ News Details | 🌦️ Weather | 🏙️ Weather by City | ⚙️ Settings |
|--------|----------------|------------|--------------------|-------------|
| ![News](https://i.postimg.cc/c43hmzgq/Screenshot-1748356929.png) | ![New details](https://i.postimg.cc/mg2cDzGd/Screenshot-1748356935.png) | ![Weather](https://i.postimg.cc/D0T0KmgP/Screenshot-1748357051.png) | ![Weather by City](https://i.postimg.cc/VvDXc7Sj/Screenshot-1748357090.png) | ![Settings](https://i.postimg.cc/Zn5k3SKh/Screenshot-1748357098.png) |

---

## 🙌 Credits

- 🌤️ **Weather API**: [OpenWeatherMap](https://openweathermap.org)
- 📰 **News API**: [NewsAPI.org](https://newsapi.org)

---

## 📌 Conclusion

NeWeather combines essential weather updates and news insights in a single, user-friendly app. Whether you're checking the forecast for your current location or exploring weather in other cities, NeWeather is designed to keep you informed and prepared. We welcome contributions and feedback to help improve the app and serve users better around the world.
