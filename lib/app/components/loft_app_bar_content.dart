import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loft/app/themes/loft_theme.dart';

class LoftAppBarContent extends StatelessWidget {
  const LoftAppBarContent({
    required this.cityName,
    this.showDropdown = true,
    this.onDropdownTap,
    super.key,
  });

  final String cityName;
  final bool showDropdown;
  final Function()? onDropdownTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/logos/loft.svg',
          color: LoftTheme.colorCustom,
          height: 32.0,
        ),
        if (showDropdown)
          GestureDetector(
            onTap: onDropdownTap,
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                Text(
                  cityName,
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
