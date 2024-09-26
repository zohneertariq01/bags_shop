import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lamp_store/provider/items_provider.dart';
import 'package:lamp_store/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LampItemProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return const MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
