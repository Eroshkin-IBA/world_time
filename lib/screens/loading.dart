import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Response response = await get(Uri.parse(
        "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam"));
    Map data = jsonDecode(response.body);
    //print(data);
    String dateTime = data['dateTime'];
    String date = data['date'];

    DateTime now = DateTime.parse(dateTime);
    print(now);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('loading page'),
    );
  }
}
