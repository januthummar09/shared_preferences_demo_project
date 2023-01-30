import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStringSecondScreen extends StatefulWidget {
  const GetStringSecondScreen({Key? key}) : super(key: key);

  @override
  State<GetStringSecondScreen> createState() => _GetStringSecondScreenState();
}

class _GetStringSecondScreenState extends State<GetStringSecondScreen> {
  SharedPreferences? sharedPreferences;
  String name = "name";
  String surname = "surname";
  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  getStringData() {
    if (sharedPreferences!.containsKey('name')) {
      name = sharedPreferences!.getString('name')!;
      // name = 'vbn';
      surname = sharedPreferences!.getString('surname')!;
    } else {
      name = 'not name data';
      surname = "not surname data";
    }
    setState(() {});

    // debugPrint("second screen getData--------------->$getData()");
    debugPrint("second screen name------------>>$name");
    debugPrint("second screen surname---------->>$surname");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get String Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "second  name: $name",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "second  surname: $surname",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getStringData();
        },
        heroTag: "get data second",
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }
}
