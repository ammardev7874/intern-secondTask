import 'package:flutter/material.dart';
import 'package:intern2ndtask/auth/login.dart';
import 'package:intern2ndtask/spalsh/light_carousol.dart/walkthrough.dart';
import 'package:intern2ndtask/widgets/indicator.dart';

class MyHomePage extends StatefulWidget {
    final Function(ThemeMode) onThemeChanged; // Callback for theme change

  const MyHomePage({super.key, required this.onThemeChanged});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
    ThemeMode _selectedTheme = ThemeMode.light; // Initial theme selection

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller and animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1, end: 1.5).animate(_animationController);

    // Delay for 3 seconds before navigating to the LoginScreen
    Future.delayed(const Duration(seconds: 3), (() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WalkThrough(
            onThemeChanged: widget.onThemeChanged, // Pass the theme change function
          ),
        ),
      );
    }));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 300),
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/images/Group.png"), // Replace with your splash image
              ),
            ),
          ),
          const SizedBox(height: 180),
          const MyCircularProgressIndicator() // Custom progress indicator
        ],
      ),
    );
  }
}
