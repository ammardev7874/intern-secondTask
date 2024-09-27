import 'package:flutter/material.dart';
import 'package:intern2ndtask/auth/login.dart';
import 'package:intern2ndtask/spalsh/light_carousol.dart/ix1.dart';
import 'package:intern2ndtask/widgets/Custombutton.dart';

import 'ix2.dart';
import 'ix3.dart';

class WalkThrough extends StatefulWidget {
  
  final Function(ThemeMode) onThemeChanged; // Callback for theme change

  const WalkThrough({super.key, required this.onThemeChanged});
  

  @override
  
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
      ThemeMode _selectedTheme = ThemeMode.light; // Initial theme selection

  
  var height, width;
  PageController controller = PageController();
  int index = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Container(
        height: height,
        width: width,
        color: const Color(0xffFFFFFF),
        child: Column(children: [
          Container(
            height: height * 0.75,
            color: Colors.white,
            width: width,
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
                print(value);
              },
              children: const [
                Ix1(),
                Ix2(),
                Ix3(),
              ],
            ),
          ),
          Container(
            height: height * 0.25,
            width: width * 0.925,
            color: const Color(0xffFFFFFF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.01), // Space between PageView and dots
                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(index == 0),
                    _buildDot(index == 1),
                    _buildDot(index == 2),
                  ],
                ),
                SizedBox(height: height * 0.04), // Space between dots and button
                CustomButton(
                  text: "Next",
                  color: const Color(0xFF465B43),
                  textColor: Colors.white,
                  onPressed: () {

                    if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  LoginScreen(
                                                        onThemeChanged: widget.onThemeChanged,

                          ),
                        ),
                      );
                    } else {
                      controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  textStyle: TextStyle(fontSize: width * 0.1),
                ),
                SizedBox(height: height * 0.015),
                Container(
                  height: height * 0.0525,
                  width: width * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.1),
                    color: const Color(0xFFA1B68C),
                  ),
                  child: const Center(
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Color(0xFF465B43),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // Widget to build individual dots
  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0), // Spacing between dots
      width: isActive ? 12.0 : 5.0, // Change size based on active state
      height: 5.0,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF465B43) : Colors.grey, // Active color and inactive color
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
