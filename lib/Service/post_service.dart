import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:template/Models/models.dart';

String lat = "12.9762";
String long = "77.6033";

String baseUrl =
    "http://api.openweathermap.org/data/2.5/air_pollution?lat=12.9762&lon=77.6033&appid=ea97e52c3dd933f4e06a02012713596a"; // URL for your API

class APIService {
  String baseUrl =
      "http://api.openweathermap.org/data/2.5/air_pollution?lat=12.9762&lon=77.6033&appid=ea97e52c3dd933f4e06a02012713596a";

  // returns a list of all posts as per my API
  // may use this in a futurebuilder
  Future<Weather> getPosts() async {
    var response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/air_pollution?lat=12.9762&lon=77.6033&appid=ea97e52c3dd933f4e06a02012713596a"));
    if (response.statusCode == 200) {
      // print(response.body);
      // print(response.body.length);
      // return a decoded body
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      // server error
      return Future.error("Server Error !");
    }
  }
}

Future<String> createPost(Map<String, dynamic> data) async {
  // For Post method
  try {
    var response = await http.post(
      Uri.parse("$baseUrl/create"),
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );
    if (response.statusCode == 200) {
      return "success";
    } else {
      print(response.body);
      // server error
      return "err";
    }
  } catch (SocketException) {
    // fetching error
    return "err";
  }
}

Future<String> deletePost(Map<String, dynamic> data) async {
  // For delete method
  try {
    var response = await http.delete(
      Uri.parse("$baseUrl/delete"),
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );
    //
    if (response.statusCode == 200) {
      return "success";
    } else {
      print(response.body);
      // server error
      return "err";
    }
  } catch (SocketException) {
    // fetching error
    return "err";
  }
}
