import 'package:flutter/material.dart';
import 'package:shared_preferences_demo_project/get_int/local_storage_frist_screen.dart';

import 'get_bool/get_bool_first_screen.dart';
import 'get_list/get_list_first_screen.dart';
import 'get_string/get_string_first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetListFirstScreen(),
      // home: const LocalStoregeFirstScreen(),
    );
  }
}
