import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time/service/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";

  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Europe', flagPath: 'amsterdam.png', url: 'Europe/Amsterdam');
    await worldTime.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'worldTime': worldTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
