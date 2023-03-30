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

    map = map.isEmpty? ModalRoute.of(context)?.settings.arguments as Map: map;
    print("passed map is ${map['worldTime']}");
    String bgImage = map['worldTime'].isDayTime ? 'day.png' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
            child: Column(
              children: [
                Center(
                  child: TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        map = {'worldTime': result['worldTime']};
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Choose location',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
                        color: Colors.white,
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
                    color: Colors.white,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
