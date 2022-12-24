import 'package:flutter/material.dart';

class LoftOutlinedButton extends StatelessWidget {
  const LoftOutlinedButton({
    required this.label,
    this.onPressed,
    super.key,
  });

  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            foregroundColor: MaterialStateProperty.all(const Color(0xFF616161)),
            overlayColor: MaterialStateProperty.all(const Color(0xFFFFDACD)),
          ),
        ),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF616161)),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
