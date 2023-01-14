import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum LoftChipType {
  outlined,
  filled,
}

class LoftChip extends StatelessWidget {
  const LoftChip({
    required this.label,
    this.icon,
    this.onTap,
    super.key,
  }) : _type = LoftChipType.filled;

  const LoftChip.outlined({
    required this.label,
    this.icon,
    this.onTap,
    super.key,
  }) : _type = LoftChipType.outlined;

  final String label;
  final IconData? icon;
  final Function()? onTap;

  final LoftChipType _type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(
            label,
            style: TextStyle(
                color: _type == LoftChipType.filled ? Colors.white : null,
                fontWeight: FontWeight.w600),
          ),
          deleteIcon: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              icon ?? CupertinoIcons.chevron_down,
              size: icon == null ? 10.0 : 16.0,
              color: _type == LoftChipType.filled ? Colors.white : null,
            ),
          ),
          onDeleted: () {},
          deleteButtonTooltipMessage: '',
          side: BorderSide(
            color: _type == LoftChipType.filled
                ? Colors.white
                : Colors.grey.shade400,
          ),
          backgroundColor:
              _type == LoftChipType.filled ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
