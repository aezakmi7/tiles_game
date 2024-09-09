import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tiles_game/features/menu_screen/view/menu_screen.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (error, stackTrace) {
    // Handle errors here
    print('Caught an error: $error');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}
