import 'package:flutter/material.dart';
import 'package:loft/app/themes/loft_theme.dart';

class MapListButton extends StatelessWidget {
  const MapListButton({
    this.onTap,
    this.showList = true,
    super.key,
  });

  final Function()? onTap;
  final bool showList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 112.0,
          minHeight: 36.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36.0),
          border: Border.all(color: Colors.grey.shade400),
        ),
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                showList
                    ? Icons.format_list_bulleted_rounded
                    : Icons.location_on,
                color: LoftTheme.colorCustom,
              ),
              const SizedBox(width: 8.0),
              Text(
                showList ? 'Lista' : 'Mapa',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
