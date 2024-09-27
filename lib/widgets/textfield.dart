import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword; // Determines if the field is for password
  final String hintText; // Required hint text

  const CustomTextField({
    super.key,
    this.isPassword = false,
    required this.hintText, required Null Function(dynamic value) onChanged, // Make hint text required
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;
  bool _isObscured = true; // For toggling password visibility
  String? _errorText; // Error text if field is empty

  @override
  void initState() {
    super.initState();

    // Listen to focus changes
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      if (_controller.text.isEmpty) {
        _errorText = widget.isPassword ? 'Password is required' : '${widget.hintText} is required'; // Show error if empty
      } else {
        _errorText = null; // Reset error if filled
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          focusNode: _focusNode,
          controller: _controller, // Attach controller to TextField
          obscureText: widget.isPassword && _isObscured, // Show/hide password based on _isObscured
          decoration: InputDecoration(
            hintText: widget.hintText, // Use required hint text
            hintStyle: const TextStyle(color: Colors.grey), // Grey hint text when not focused
            prefixIcon: Icon(
              widget.isPassword ? Icons.lock : Icons.email, // Use lock icon for password field
              color: _isFocused ? Colors.black : Colors.grey, // Icon color changes when focused
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                      color: _isFocused ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured; // Toggle password visibility
                      });
                    },
                  )
                : null, // No suffixIcon for non-password fields
            filled: true, // Always filled with the given color
            fillColor: _isFocused ? const Color(0xffF4FFF1) : const Color(0xFFFDFDFD), // Light green when focused
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              borderSide: BorderSide.none, // No border when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
              borderSide: const BorderSide(
                color: Color(0xFF465B43), // Dark green border when focused
                width: 1.0, // Thickness of the border
              ),
            ),
            errorText: _errorText, // Display error message if any
          ),
          style: const TextStyle(color: Colors.black), // Black text when typing
          cursorColor: const Color(0xFF465B43), // Green cursor
          onChanged: (text) {
            _validateInput(); // Validate input on every change
          },
        ),
        const SizedBox(height: 16.0), // Space for clarity
      ],
    );
  }
}
