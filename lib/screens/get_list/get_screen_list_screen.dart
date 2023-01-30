import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetListSecondScreen extends StatefulWidget {
  const GetListSecondScreen({Key? key}) : super(key: key);

  @override
  State<GetListSecondScreen> createState() => _GetListSecondScreenState();
}

class _GetListSecondScreenState extends State<GetListSecondScreen> {
  SharedPreferences? sharedPreferences;
  List name = ['janki', 'kajal'];
  List surname = ['Thummar', 'Thummar'];

  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  getListData() {
    if (sharedPreferences!.containsKey('std_name')) {
      debugPrint("true");
      name = sharedPreferences!.getStringList('std_name')!;
      surname = sharedPreferences!.getStringList('roll_no')!;
    } else if (sharedPreferences!.containsKey('roll_no')) {
      debugPrint("false");
      name = ['j', 'k', 'l'];
      surname = [0, 1, 2];
    } else {
      debugPrint("false");
      name = ['aa', 'bb', 'cc'];
      surname = [11, 12, 13];
    }
    // name = sharedPreferences!.getStringList('std_name')!;
    // surname = sharedPreferences!.getStringList('roll_no')!;
    debugPrint("getListData name---------->>$name");
    debugPrint("getListData rollNo---------->>$surname");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Screen Second Screen'),
        backgroundColor: const Color(0xff396b37),
        foregroundColor: const Color(0xfff0e7a3),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: name.length,
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
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          " Name   :${name[index]}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xfff0e7a3),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Surname:${surname[index]}",
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
          ],
        ),
      ),
    );
  }
}
