import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loft/app/themes/loft_theme.dart';

class LoftAppBarContent extends StatelessWidget {
  const LoftAppBarContent({this.showDropdown = true, super.key});

  final bool showDropdown;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/logos/loft.svg',
          color: LoftTheme.colorCustom,
          height: 32.0,
        ),
        if (showDropdown) ...[
          const SizedBox(width: 12.0),
          Text(
            'Sao Paulo',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Icon(Icons.keyboard_arrow_down_rounded)
        ]
      ],
    );
  }
}
