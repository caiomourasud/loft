import 'package:flutter/material.dart';

class LoftEmptyPageComponent extends StatelessWidget {
  const LoftEmptyPageComponent({
    required this.title,
    required this.subtitle,
    this.icon,
    this.actionButton,
    this.isActionButtonExpanded,
    this.titleStyle,
    this.textAlign,
    this.padding,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget? icon;
  final Widget? actionButton;
  final bool? isActionButtonExpanded;
  final TextStyle? titleStyle;
  final TextAlign? textAlign;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: textAlign == TextAlign.left
            ? CrossAxisAlignment.start
            : textAlign == TextAlign.right
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 62.0),
            child: Column(
              crossAxisAlignment: textAlign == TextAlign.left
                  ? CrossAxisAlignment.start
                  : textAlign == TextAlign.right
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (icon != null) ...[icon!, const SizedBox(height: 28.0)],
                Text(
                  title,
                  textAlign: textAlign ?? TextAlign.center,
                  style: (titleStyle ?? Theme.of(context).textTheme.titleLarge)
                      ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  subtitle,
                  textAlign: textAlign ?? TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          if (actionButton != null) ...[
            const SizedBox(height: 22.0),
            Padding(
              padding: padding ?? EdgeInsets.zero,
              child: SizedBox(
                  width:
                      isActionButtonExpanded == true ? double.infinity : null,
                  child: actionButton!),
            ),
          ]
        ],
      ),
    );
  }
}
