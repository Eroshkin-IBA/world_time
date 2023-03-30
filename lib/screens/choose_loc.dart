import 'package:flutter/material.dart';

import '../service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> list = [
    WorldTime(
        location: 'Amsterdam',
        flagPath: 'Amsterdam.png',
        url: 'Europe/Amsterdam'),
    WorldTime(location: 'Berlin', flagPath: 'Berlin.png', url: 'Europe/Berlin'),
    WorldTime(
        location: 'Atlantic', flagPath: 'ca.jpg', url: 'Canada/Atlantic'),
    WorldTime(location: 'Tbilisi', flagPath: 'g.png', url: 'Asia/Tbilisi'),
    WorldTime(
        location: 'Budapest', flagPath: 'bud.png', url: 'Europe/Budapest'),
  ];

  void updateTime(i) async {
    WorldTime instance = list[i];
    await instance.getData();
    Navigator.pop(context, {
      'worldTime': instance,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Choose location',
          style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(i);
                },
                title: Text(list[i].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${list[i].flagPath}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
