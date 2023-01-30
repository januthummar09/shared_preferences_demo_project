import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetFirstModelScreen extends StatefulWidget {
const GetFirstModelScreen({ Key? key }) : super(key: key);

  @override
  State<GetFirstModelScreen> createState() => _GetFirstModelScreenState();
}

class _GetFirstModelScreenState extends State<GetFirstModelScreen> {
  SharedPreferences? sharedPreferences;
  @override
  void initState() {
    super.initState();
    getInstanceData();
  }
  getInstanceData() async {
    sharedPreferences=await SharedPreferences.getInstance();
  }
  getModelData(){
    
  }
  @override
  Widget build(BuildContext context){
    return Scaffold();
  }
}