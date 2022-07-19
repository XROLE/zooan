import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zooan/app/core/di/service_locator.dart';
import 'package:zooan/presentation/home.dart';
import 'package:zooan/presentation/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
