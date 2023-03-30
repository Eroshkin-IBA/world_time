import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  late DateTime dateTime;
  late String time;
  String flagPath;
  String url;
  late bool isDayTime;

  WorldTime(
      {required this.location, required this.flagPath, required this.url});

  Future<void> getData() async {
    try {
      Response response = await get(
          Uri.parse("https://timeapi.io/api/Time/current/zone?timeZone=$url"));
      Map data = jsonDecode(response.body);
      //print(data);
      time = data['time'];
      String date = data['dateTime'];

      dateTime = DateTime.parse(date);
      isDayTime = dateTime.hour > 6 && dateTime.hour < 20 ? true : false;
      // now = now.add(Duration(hours: int.parse(time)));
      print(isDayTime);
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
