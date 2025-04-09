import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'constants/app_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.secondaryBlack, // Set your desired color
    statusBarIconBrightness: Brightness.light, // For white icons
  ));

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );

  // For Testing Ui Screens
  /*runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(child: MyApp()),
    ),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
