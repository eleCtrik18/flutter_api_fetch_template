class Weather {
  var aqi;

  Weather({this.aqi});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      aqi: json['list'][0]['main']['aqi'],
    );
  }
}
