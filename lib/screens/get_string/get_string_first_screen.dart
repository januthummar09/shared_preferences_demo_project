import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_string_second_screen.dart';

class GetStringFirstScreen extends StatefulWidget {
  const GetStringFirstScreen({Key? key}) : super(key: key);

  @override
  State<GetStringFirstScreen> createState() => _GetStringFirstScreenState();
}

class _GetStringFirstScreenState extends State<GetStringFirstScreen> {
  String str1 = "Janki";
  String str2 = "Thummar";

  SharedPreferences? sharedPreferences;
  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setStringData() async {
    await sharedPreferences!.setString('name', 'kajal');
    await sharedPreferences!.setString('surname', 'Thummar');
    debugPrint("setStringData name -------------->>$str1");
    debugPrint("setStringData surname -------------->>$str2");
  }

  getStringData() {
    if (sharedPreferences!.containsKey('name') &&
        sharedPreferences!.containsKey('surname')) {
      debugPrint("getStringData  -------------->>true");

      str1 = sharedPreferences!.getString('name')!;
      str2 = sharedPreferences!.getString('surname')!;
      debugPrint("getStringData name -------------->>$str1");
      debugPrint("getStringData surname -------------->>$str2");
    } else {
      debugPrint("getStringData  -------------->>false");

      str1 = 'Rutik';
      str2 = 'Thummar';
      debugPrint("getStringData name -------------->>$str1");
      debugPrint("getStringData surname -------------->>$str2");
    }
    setState(() {});
    //   str1 = sharedPreferences!.getString('name')!;
    // str2 = sharedPreferences!.getString('surname')!;
    // debugPrint("getStringData name -------------->>$str1");
    // debugPrint("getStringData surname -------------->>$str2");
  }

  removeStringData() {
    sharedPreferences!.remove('name');
    debugPrint("removeStringData data -------------->>$removeStringData()");
    debugPrint("removeStringData name -------------->>$str1");
    debugPrint("removeStringData surname -------------->>$str2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get String First Screen")),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                getStringData();
              },
              heroTag: "get data",
              child: const Icon(Icons.arrow_downward),
            ),
            FloatingActionButton(
              onPressed: () {
                setStringData();
              },
              heroTag: "set data",
              child: const Icon(Icons.arrow_upward),
            ),
            FloatingActionButton(
              onPressed: () {
                removeStringData();
                debugPrint("remove counter---------->>$removeStringData()");
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
              "Name: $str1",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "surname: $str2",
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
                    builder: (context) => const GetStringSecondScreen(),
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
