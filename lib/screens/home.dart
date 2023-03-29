import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map map = {};

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)?.settings.arguments as Map;
    print("passed map is ${map['worldTime']}");

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
          child: Column(
            children: [
              Center(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: const Icon(Icons.edit_location),
                    label: const Text('Choose location')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    map['worldTime'].location,
                    style: const TextStyle(
                      fontSize: 70,
                      fontFamily: 'Delicious Handrawn',
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '${map['worldTime'].time}',
                style: const TextStyle(
                  fontSize: 70,
                  fontFamily: 'Delicious Handrawn',
                  letterSpacing: 2.0,
                ),
              )
            ],
          )),
    );
  }
}
