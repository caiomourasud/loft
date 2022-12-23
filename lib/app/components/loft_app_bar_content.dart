import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loft/app/themes/loft_theme.dart';

class LoftAppBarContent extends StatelessWidget {
  const LoftAppBarContent({
    this.showDropdown = true,
    super.key,
  });

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
        const SizedBox(width: 12.0),
        if (showDropdown)
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                Text(
                  'Sao Paulo',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 12.0),
                Icon(
                  CupertinoIcons.chevron_down,
                  color: Colors.grey.shade600,
                  size: 14.0,
                ),
              ],
            ),
          )
      ],
    );
  }
}