import 'package:flutter/material.dart';

class LoftButton extends StatelessWidget {
  const LoftButton({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets?>(
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)),
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
      onPressed: () {},
      child: Text(label),
    );
  }
}
