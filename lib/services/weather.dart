import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '81a4a71ebd3d200ce7bfc12bb29dd245';
const mapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class Weather {
  Future<dynamic> getCityWeather(String cityName) async {
    Networking networking =
        Networking('$mapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(
        '$mapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var getWeatherData = await networking.getData();
    return getWeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getWeatherMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
