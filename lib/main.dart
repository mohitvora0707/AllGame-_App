import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'Web_View_Game.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Web_Viwe_GAme(),
    );
  }
}
