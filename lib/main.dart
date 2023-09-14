import 'package:flutter/material.dart';
import 'package:mvvm_basic/views/screens/home/home.dart';
import 'package:mvvm_basic/views/screens/home/home_view_model.dart';
import 'package:mvvm_basic/views/styles/general_styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildThemeData(),
      title: 'Flutter Demo',
      home: const Home()
    );
  }
}
