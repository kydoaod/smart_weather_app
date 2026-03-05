class WeatherData {
  final String location;
  final String day;
  final String date;
  final int temperature;
  final String condition;
  final double windSpeed;
  final int chanceOfIce;
  final int pressure;
  final int humidity;

  WeatherData({
    required this.location,
    required this.day,
    required this.date,
    required this.temperature,
    required this.condition,
    required this.windSpeed,
    required this.chanceOfIce,
    required this.pressure,
    required this.humidity,
  });
}

class DeviceData {
  final String location;
  final int temperature;
  final String statusText;
  final bool needsAction;

  DeviceData({
    required this.location,
    required this.temperature,
    required this.statusText,
    required this.needsAction,
  });
}
