import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_screen_list_screen.dart';

class GetListFirstScreen extends StatefulWidget {
  const GetListFirstScreen({Key? key}) : super(key: key);

  @override
  State<GetListFirstScreen> createState() => _GetListFirstScreenState();
}

class _GetListFirstScreenState extends State<GetListFirstScreen> {
  SharedPreferences? sharedPreferences;
  List list1 = [1, 2, 3, 4, 5, 6];
  List list2 = ['bn', 'bnm', 'nm', 'jkl', 'bnm', 'bbb'];

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

  removeData() {
    sharedPreferences!.remove('std_name');
    sharedPreferences!.remove('roll_no');
    debugPrint("remove list---------->>$removeData()");
    debugPrint("remove list name---------->>$list1");
    debugPrint("remove list rollNo---------->>$list2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get List First Screen'),
        backgroundColor: const Color(0xff396b37),
        foregroundColor: const Color(0xfff0e7a3),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              backgroundColor: const Color(0xff396b37),
              foregroundColor: const Color(0xfff0e7a3),
              onPressed: () {
                getListData();
              },
              heroTag: "get data",
              child: const Icon(Icons.arrow_downward),
            ),
            FloatingActionButton(
              backgroundColor: const Color(0xff396b37),
              foregroundColor: const Color(0xfff0e7a3),
              onPressed: () {
                setListData();
              },
              heroTag: "set data",
              child: const Icon(Icons.arrow_upward),
            ),
            FloatingActionButton(
              backgroundColor: const Color(0xff396b37),
              foregroundColor: const Color(0xfff0e7a3),
              onPressed: () {
                removeData();
              },
              heroTag: "remove data",
              child: const Icon(Icons.delete),
            ),
            FloatingActionButton(
              backgroundColor: const Color(0xff396b37),
              foregroundColor: const Color(0xfff0e7a3),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GetListSecondScreen(),
                  ),
                );
              },
              heroTag: "Next screen",
              child: const Icon(Icons.send),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 120,
            top: 20,
          ),
          child: ListView(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list1.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xff396b37),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "list1 Data:${list1[index]}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xfff0e7a3),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "list2 Data:${list2[index]}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xfff0e7a3),
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Text(
              //   "name list: $list1",
              //   style: const TextStyle(
              //     fontSize: 23,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // Text(
              //   "RollNo list: $list2",
              //   style: const TextStyle(
              //     fontSize: 23,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 40),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const GetListSecondScreen(),
              //         ),
              //       );
              //     },
              //     style: ButtonStyle(
              //       backgroundColor:
              //           MaterialStateProperty.all(const Color(0xff396b37)),
              //       foregroundColor:
              //           MaterialStateProperty.all(const Color(0xfff0e7a3)),
              //     ),
              //     child: const Text("Next Screen"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
