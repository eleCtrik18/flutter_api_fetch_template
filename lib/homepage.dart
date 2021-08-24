import 'package:flutter/material.dart';
import 'package:template/Models/models.dart';
import 'package:template/Service/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

APIService apiService = APIService();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AQI'),
          centerTitle: true,
        ),
        body: FutureBuilder<Weather>(
          future: apiService.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data);
            }
            if (snapshot.hasData) {
              return Container(
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'AQI : ',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  Text(
                    "${snapshot.data!.aqi}",
                    style: TextStyle(color: Colors.green, fontSize: 24),
                  ),
                ]),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
