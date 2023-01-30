import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_demo_project/get_bool/get_bool_second_screen.dart';

class GetBoolFirstScreen extends StatefulWidget {
  const GetBoolFirstScreen({Key? key}) : super(key: key);

  @override
  State<GetBoolFirstScreen> createState() => _GetBoolFirstScreenState();
}

class _GetBoolFirstScreenState extends State<GetBoolFirstScreen> {
  SharedPreferences? sharedPreferences;
  bool doneOne = false;
  bool doneTwo = true;
  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setBoolData() async {
    await sharedPreferences!.setBool('boolOne', true);
    await sharedPreferences!.setBool('boolTwo', false);
  }

  getBoolData() {
    if (sharedPreferences!.containsKey('boolOne')) {
      //direct check thai  sake aa condition thi ke data get thay che ke nay. if (sharedPreferences!.containsKey('asdfg'))
      debugPrint("getBoolData---------->> true");
      doneOne = sharedPreferences!.getBool('boolOne')!;
      doneTwo = sharedPreferences!.getBool('boolTwo')!;
    } else {
      debugPrint("getBoolData---------->> false");
      doneOne = false;
      doneTwo = false;
    }

    setState(() {});
  }

  removeBoolData() {
    sharedPreferences!.remove('boolOne');
    sharedPreferences!.remove('boolTwo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Bool First Screen"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                getBoolData();
                debugPrint("getBoolData--------------->>$getBoolData()");
                debugPrint("getBoolData counter---------->>$doneOne");
                debugPrint("getBoolData counter---------->>$doneTwo");
              },
              heroTag: "get data",
              child: const Icon(Icons.arrow_downward),
            ),
            FloatingActionButton(
              onPressed: () {
                setBoolData();
                debugPrint("setBoolData--------------->>$setBoolData()()()");
                debugPrint("setBoolData counter---------->>$doneOne");
                debugPrint("setBoolData counter---------->>$doneTwo");
              },
              heroTag: "set data",
              child: const Icon(Icons.arrow_upward),
            ),
            FloatingActionButton(
              onPressed: () {
                removeBoolData();
                debugPrint("remove counter---------->>$removeBoolData()()");
              },
              heroTag: "remove data",
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bool One: $doneOne",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Bool Two: $doneTwo",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GetBoolSecondScreen(),
                  ),
                );
              },
              child: const Text("Next Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
