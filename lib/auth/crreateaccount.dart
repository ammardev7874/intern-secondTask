import 'package:flutter/material.dart';
import 'package:intern2ndtask/auth/crreateaccount.dart';
import 'package:intern2ndtask/auth/sigin.dart';
import 'package:intern2ndtask/widgets/Custombutton.dart';
import 'package:intern2ndtask/widgets/textfield.dart';

class CreateAccountScreen extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged; // Callback for theme change

  const CreateAccountScreen({super.key, required this.onThemeChanged});

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _rememberMe = false;
  String _email = ''; // To track the email input
  String _password = ''; // To track the password input

  // Check if both fields are filled
  bool get _isFormFilled => _email.isNotEmpty && _password.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    // Get screen size
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Get the current theme mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05), // Adaptive padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05), // Adaptive height for spacing
              SizedBox(
                width: width * 0.6,
                child: Text(
                  maxLines: 2,
                  'Create your Account',
                  style: TextStyle(
                    letterSpacing: width * 0.002,
                    fontSize: width * 0.09, // Adaptive font size
                    fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color ??
                              (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors
                                      .black),  // Change color based on theme
                  ),
                ),
              ),
              SizedBox(height: height * 0.07), // Adaptive height for spacing
              CustomTextField(
                hintText: 'Email',
                onChanged: (value) {
                  setState(() {
                    _email = value; // Update the email value
                  });
                },
              ),
              SizedBox(height: height * 0.03), // Adaptive height for spacing
              CustomTextField(
                isPassword: true,
                hintText: "Password",
                onChanged: (value) {
                  setState(() {
                    _password = value; // Update the password value
                  });
                },
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.275),
                  Checkbox(
                    checkColor: const Color(0xffFFFfff),
                    activeColor: const Color(0xFF465B43),
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                        fontSize: width * 0.035,
                        color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color ??
                              (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors
                                      .black), // Change color based on theme
                        fontWeight: FontWeight.w500), // Adaptive font size
                  ),
                ],
              ),
                            SizedBox(height: height * 0.01), // Adaptive height for spacing

              // Button changes color based on whether the form is filled
              CustomButton(
                text: "Sign up",
                color: _isFormFilled
                    ? const Color(0xFF465B43)
                    : const Color(
                        0xFF465B43), // Change color based on form state
                textColor: Colors.white,
                onPressed: () {
                  // Handle sign up action here
                },
                textStyle: const TextStyle(),
              ),
                            SizedBox(height: height * 0.01), // Adaptive height for spacing

              Center(
                child: Text(
                        "Forgot the password?  ",
                        style: TextStyle(
                          fontSize: width * 0.03,
                          color:
                              isDarkMode ? Colors.white : const Color(0xFF465B43),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ),
              SizedBox(height: height * 0.05), // Adaptive height for spacing
              Row(
                children: [
                  SizedBox(width: width * 0.02),
                  Container(
                    height: height * 0.0005,
                    width: width * 0.25,
                    color: Colors.grey,
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    'or continue with',
                    style: TextStyle(
                      fontSize: width * 0.04,
                       color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color ??
                              (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors
                                      .black), // Change color based on theme
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Container(
                    height: height * 0.0005,
                    width: width * 0.25,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: height * 0.03), // Adaptive height for spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.2,
                    height: height * 0.065,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: width * 0.001), // Grey border
                      borderRadius:
                          BorderRadius.circular(12.0), // Circular border radius
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Icon(
                        Icons.facebook,
                        size: width * 0.06,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05), // Adaptive width for spacing
                  Container(
                    width: width * 0.2,
                    height: height * 0.065,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: width * 0.001), // Grey border
                      borderRadius:
                          BorderRadius.circular(12.0), // Circular border radius
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Image.asset(
                        "assets/images/Frame (4).png",
                        height: width * 0.05, // Set height similar to icon size
                        width: width * 0.05, // Set width similar to icon size
                        fit: BoxFit
                            .contain, // Ensure the image fits within the given size
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05), // Adaptive width for spacing
                  Container(
                    width: width * 0.2,
                    height: height * 0.065,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: width * 0.001), // Grey border
                      borderRadius:
                          BorderRadius.circular(12.0), // Circular border radius
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Icon(
                        Icons.apple,
                        size: width * 0.06,
 color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color ??
                              (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors
                                      .black),                       ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04), // Adaptive height for spacing
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SignInScreen(
onThemeChanged: widget.onThemeChanged,                      ), // Replace 'NextScreen()' with your target screen
                    ),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: width * 0.2),
                    Text(
                      "Already have an account?  ",
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color:
                            isDarkMode ? Colors.white : const Color(0xff9CA4AB),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color:
                            isDarkMode ? Colors.white : const Color(0xFF465B43),
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
