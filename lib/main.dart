import 'package:flutter/material.dart';
import 'package:intern2ndtask/auth/login.dart';
import 'package:intern2ndtask/spalsh/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // Default theme mode

  // Function to change the theme mode
  void _changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode, // Apply the theme mode
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255), // White background for light mode
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black), // Icon color in AppBar
        ),
        // Other light theme settings can be added here
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Full black background for dark mode
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white), // Icon color in AppBar
        ),
        textTheme: TextTheme(displayMedium: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        // Other dark theme settings can be added here
      ),
      home: MyHomePage(
        onThemeChanged: _changeTheme, // Pass the function to change theme
      ),
    );
  }
}
