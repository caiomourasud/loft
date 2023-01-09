import 'package:flutter/material.dart';

class LoftEmptyPageComponent extends StatelessWidget {
  const LoftEmptyPageComponent({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actionButton,
    super.key,
  });

  final Icon icon;
  final String title;
  final String subtitle;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            icon,
            const SizedBox(height: 36.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16.0),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (actionButton != null) ...[
              const SizedBox(height: 16.0),
              actionButton!,
            ]
          ],
        ),
      ),
    );
  }
}
