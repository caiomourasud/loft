import 'package:flutter/material.dart';
import 'package:loft/app/components/loft_button.dart';

class LoftOutlinedButton extends StatelessWidget {
  const LoftOutlinedButton({
    required this.label,
    this.onPressed,
    this.loftButtonSize = LoftButtonSize.large,
    super.key,
  });

  final String label;
  final Function()? onPressed;
  final LoftButtonSize loftButtonSize;

  double get paddingSize => loftButtonSize == LoftButtonSize.large ? 16.0 : 8.0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 16.0, vertical: paddingSize),
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
