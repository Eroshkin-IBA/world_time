import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  late DateTime dateTime;
  late String time;
  String flagPath;
  String url;

  WorldTime(
      {required this.location, required this.flagPath, required this.url});

  Future<void> getData() async {
    try {
      Response response = await get(
          Uri.parse("https://timeapi.io/api/Time/current/zone?timeZone=$url"));
      Map data = jsonDecode(response.body);
      //print(data);
      // String time = data['time'];
      String date = data['dateTime'];

      dateTime = DateTime.parse(date);

      // now = now.add(Duration(hours: int.parse(time)));

      time = dateTime.toString();
    } catch (e) {
      time = "ops, something go wrong";
      print(e);
    }
  }

  @override
  String toString() {
    return 'WorldTime{location: $location, time: $time, flagPath: $flagPath, url: $url}';
  }
}
