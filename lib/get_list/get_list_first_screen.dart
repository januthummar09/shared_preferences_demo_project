import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_screen_second_screen.dart';

class GetListFirstScreen extends StatefulWidget {
  const GetListFirstScreen({Key? key}) : super(key: key);

  @override
  State<GetListFirstScreen> createState() => _GetListFirstScreenState();
}

class _GetListFirstScreenState extends State<GetListFirstScreen> {
  SharedPreferences? sharedPreferences;
  List list1 = [1, 2, 3, 4];
  List list2 = ['bn', 'bnm', 'nm', 'jkl'];

  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setListData() async {
    await sharedPreferences!.setStringList(
        'std_name', ["janki", 'kajal', 'nency', 'kinjal']); // only for setInt
    await sharedPreferences!.setStringList(
        'roll_no', ['1', '2', '3', '4', '5', '5']); // only for setInt
    debugPrint("setListData name---------->>$list1");
    debugPrint("setListData rollNo---------->>$list2");
  }

  getListData() {
    // if (sharedPreferences!.containsKey('std_name')) {
    //   debugPrint("true");
    //   list1 = sharedPreferences!.getStringList('std_name')!;
    //   list2 = sharedPreferences!.getStringList('roll_no')!;
    // } else {
    //   debugPrint("false");
    //   list1 = ['aa', 'bb', 'cc'];
    //   list2 = [11, 12, 13];
    // }
    list1 = sharedPreferences!.getStringList('std_name')!;
    list2 = sharedPreferences!.getStringList('roll_no')!;
    debugPrint("getListData name---------->>$list1");
    debugPrint("getListData rollNo---------->>$list2");
    setState(() {});
  }

  // removeData() {
  //   sharedPreferences!.remove('counter');
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get List First Screen')),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                getListData();
              },
              heroTag: "get data",
              child: const Icon(Icons.arrow_downward),
            ),
            FloatingActionButton(
              onPressed: () {
                setListData();
              },
              heroTag: "set data",
              child: const Icon(Icons.arrow_upward),
            ),
            // FloatingActionButton(
            //   onPressed: () {
            //     removeData();
            //     debugPrint("remove counter---------->>$removeData()");
            //   },
            //   heroTag: "remove data",
            //   child: const Icon(Icons.delete),
            // ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "name list: $list1",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "RollNo list: $list2",
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
                    builder: (context) => const GetScreenSecondScreen(),
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
