import 'package:flutter/material.dart';

class ThreeDElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  ThreeDElevatedButton({required this.text, required this.onPressed});

  @override
  _ThreeDElevatedButtonState createState() => _ThreeDElevatedButtonState();
}

class _ThreeDElevatedButtonState extends State<ThreeDElevatedButton> {
  double _elevation = 8.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        // Update the button's style when pressed down
        setState(() {
          _elevation = 4.0;
        });
      },
      onTapCancel: () {
        // Reset the button's style when press is canceled
        setState(() {
          _elevation = 8.0;
        });
      },
      onTap: widget.onPressed,
      child: Ink(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFEAEAEA),
              Color(0xFFD4D4D4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(2, 2),
              blurRadius: _elevation,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
