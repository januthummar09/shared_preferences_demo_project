import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetBoolSecondScreen extends StatefulWidget {
  const GetBoolSecondScreen({Key? key}) : super(key: key);

  @override
  State<GetBoolSecondScreen> createState() => _GetBoolSecondScreenState();
}

class _GetBoolSecondScreenState extends State<GetBoolSecondScreen> {
  bool checkOne = true;
  bool checkTwo = true;
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  getBoolData() {
    if (sharedPreferences!.containsKey('boolTwo')) {
      checkOne = sharedPreferences!.getBool('boolOne')!;
      checkTwo = sharedPreferences!.getBool('boolTwo')!;

      debugPrint("second screen getData getBoolData checkOne----->>$checkOne");
      debugPrint("second screen getData getBoolData checkTwo----->>$checkTwo");
    } else {
      checkOne = false;
      checkTwo = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Bool Second Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getBoolData();
          debugPrint("second screen getData--------------->$getBoolData()()");
          // debugPrint("counter---------->>$checkOne");
          // debugPrint("counter---------->>$checkTwo");
        },
        heroTag: "get data second",
        child: const Icon(Icons.arrow_downward),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: $checkOne",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "CounterTwo: $checkTwo",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
