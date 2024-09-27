import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;         // Button background color
  final Color textColor;     // Text color
  final VoidCallback onPressed;
  final double? height;      // Optional height
  final double? width;       // Optional width

  const CustomButton({super.key, 
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
    this.height,  
    this.width, required TextStyle textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;

    // Default button height and width if not provided
    final defaultHeight = Height * 0.058;  // 7% of screen height
    final defaultWidth = Width * 0.925;     // 80% of screen width

    return SizedBox(
      height: height ?? defaultHeight,  // Use provided height or default
      width: width ?? defaultWidth,    // Use provided width or default
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,  // Set the button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,  // Set the text color
            fontSize: Width * 0.038,  // Responsive text size
          ),
        ),
      ),
    );
  }
}
