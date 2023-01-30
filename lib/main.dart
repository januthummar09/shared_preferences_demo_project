import 'package:flutter/material.dart';
import 'package:shared_preferences_demo_project/screens/get_bool/get_bool_firstt_screen.dart';
import 'package:shared_preferences_demo_project/screens/get_int/local_storage_frist_screen.dart';
import 'package:shared_preferences_demo_project/screens/get_model/get_first_model_screen.dart';

import 'screens/get_list/get_list_first_screen.dart';
import 'screens/get_string/get_string_first_screen.dart';

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
      home: const GetFirstModelScreen(),
      // home: const LocalStoregeFirstScreen(),
    );
  }
}
