# Weather.me
## Weather.me – an app that can help you check the weather anywhere at any time! 🌡
This app works with **OpenWeatherMap API[^*]** to get current weather in real-time.

### App's UI:
- One main screen
  - Current location button
  - Search by city text field
  - Search button
- Color mode
  - two background images for dark and light mode (the color mode is base on the phone's settings)

### App underhood:
- **MVC**,
  - for structuring and separating code files into _models, views,_ and _controllers_.
- **Delegate pattern**,
  - for sending data between files
- **URLSession**,
  - for requesting/getting data from API
- **Auto Layout**,
  - setting up the UI design for all screen sizes (from iPhone SE 2 to iPhone 13 Pro Max).



### 🚨🚨🚨Feel free to check out the app's gif presentation below👇👇👇

![weather me](https://user-images.githubusercontent.com/92067827/157108897-035a5279-3618-490d-b236-375130f70faf.gif)

(Demonstration of the iPhone 11 in both dark and light mode.)

[^*]: Please, note to use your own [OpenWeatherMap API](https://openweathermap.org/api)' API key in the WeatherManager.swift file of source code.
