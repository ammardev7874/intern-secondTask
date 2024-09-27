import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intern2ndtask/auth/crreateaccount.dart';
import 'package:intern2ndtask/widgets/Custombutton.dart';

class LoginScreen extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged; // Callback for theme change

  const LoginScreen({super.key, required this.onThemeChanged});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ThemeMode _selectedTheme = ThemeMode.light; // Initial theme selection

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the screen
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0, // Optional: Remove the elevation to make it flat
        actions: [
          PopupMenuButton<ThemeMode>(
                       icon: Icon(Icons.color_lens, color: Theme.of(context).appBarTheme.iconTheme?.color),

            onSelected: (ThemeMode theme) {
              setState(() {
                _selectedTheme = theme;
              });
              widget.onThemeChanged(theme); // Trigger theme change
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: ThemeMode.light,
                child: Text('Light Theme'),
              ),
              const PopupMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark Theme'),
              ),
              const PopupMenuItem(
                value: ThemeMode.system,
                child: Text('System Default'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05), // Add padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image with dynamic height
              Image.asset(
                "assets/images/Frame (3).png",
                height: height * 0.2, // 20% of screen height
              ),
              SizedBox(height: height * 0.04), // 4% of screen height
              Text(
                "Let's you in",
                style: TextStyle(
                  fontSize: width * 0.065, // 6.5% of screen width
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.displayMedium?.color ??
                      (Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white), // Adjust color based on theme
                ),
              ),
              SizedBox(height: height * 0.04), // 4% of screen height

              // Facebook button
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: width * 0.001), // Grey border
                  borderRadius:
                      BorderRadius.circular(12.0), // Circular border radius
                ),
                child: TextButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook,
                          size: width * 0.06,
                          color: Colors.blue), // Icon size based on width
                      SizedBox(
                          width: width * 0.02), // Space between icon and text
                      Text(
                        'Continue with Facebook',
                        style: TextStyle(
                          fontSize: width * 0.035,
                         color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color ??
                              (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors
                                      .black), // Adjust color based on theme
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02), // 4% of screen height

              // Google button
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: width * 0.001), // Grey border
                  borderRadius:
                      BorderRadius.circular(12.0), // Circular border radius
                ),
                child: TextButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Frame (4).png",
                        height: width * 0.05,
                        width: width * 0.05,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                          width: width * 0.02), // Space between icon and text
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color ??
                              (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors
                                      .black),// Adjust color based on theme
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02), // 4% of screen height

              // Apple button
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: width * 0.001), // Grey border
                  borderRadius:
                      BorderRadius.circular(12.0), // Circular border radius
                ),
                child: TextButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(Icons.apple, color: Theme.of(context).appBarTheme.iconTheme?.color),
                      SizedBox(
                          width: width * 0.02), // Space between icon and text
                      Text(
                        'Continue with Apple',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color ??
                              (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors
                                      .black), // Adjust color based on theme
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.05), // 4% of screen height

              Row(
                children: [
                  SizedBox(width: width * 0.04),
                  Container(
                    height: height * 0.0005,
                    width: width * 0.35,
                    color: Colors.grey,
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    'or',
                    style: TextStyle(
                      fontSize: width * 0.04, // Font size based on width
color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color ??
                              (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors
                                      .black),                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Container(
                    height: height * 0.0005,
                    width: width * 0.35,
                    color: Colors.grey,
                  ),
                ],
              ),
              // Sign in button
              SizedBox(height: height * 0.04), // 4% of screen height
              CustomButton(
                text: "Sign in with password",
                color: const Color(0xFF465B43),
                textColor: Colors.white,
                onPressed: () {},
                textStyle: TextStyle(fontSize: width * 0.1),
              ),

              // Don't have an account text
              SizedBox(height: height * 0.02), // 2% of screen height
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAccountScreen(
                        onThemeChanged: widget.onThemeChanged,
                      ), // Navigate to Create Account
                    ),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: width * 0.2),
                    Text(
                      "Don't have an account?  ",
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color: const Color(0xff9CA4AB),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: const Color(0xFF465B43),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
