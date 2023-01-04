import 'package:flutter/material.dart';

enum LoftButtonSize {
  small,
  large,
}

class LoftButton extends StatelessWidget {
  const LoftButton({
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
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets?>(
          EdgeInsets.symmetric(horizontal: 16.0, vertical: paddingSize),
        ),
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: Colors.deepOrange,
            ),
          ),
        ),
        overlayColor: MaterialStateProperty.all(const Color(0xFFEB673B)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
