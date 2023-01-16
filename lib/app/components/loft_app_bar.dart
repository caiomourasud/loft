import 'package:flutter/material.dart';
import 'package:loft/app/components/loft_app_bar_content.dart';
import 'package:loft/app/components/select_city_modal.dart';
import 'package:loft/app/models/city.dart';

enum LoftAppBarType {
  withTitle,
  noTitle,
}

class LoftAppBar extends StatelessWidget with PreferredSizeWidget {
  const LoftAppBar({
    this.bottom,
    this.title,
    this.selectedCity,
    this.showCityDropdown = true,
    this.hasScaffoldBody = true,
    this.loftAppBarType,
    this.appBarHeight,
    this.listScrolled = false,
    this.onCitySelected,
    super.key,
  });

  final PreferredSizeWidget? bottom;
  final String? title;
  final City? selectedCity;
  final bool showCityDropdown;
  final bool hasScaffoldBody;
  final LoftAppBarType? loftAppBarType;
  final double? appBarHeight;
  final bool listScrolled;
  final Function(City?)? onCitySelected;

  @override
  Widget build(BuildContext context) {
    Widget getAppBarTitle() => title != null && title != ''
        ? AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: (listScrolled
                    ? Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        )
                    : Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        )) ??
                const TextStyle(),
            child: Text(
              title!,
            ),
          )
        : LoftAppBarContent(
            cityName: selectedCity?.name ?? '',
            showDropdown: showCityDropdown,
            onDropdownTap: () {
              SelectCityModal.show(context, selectedCity: selectedCity,
                  onCitySelected: (city) {
                onCitySelected?.call(city);
                Navigator.pop(context);
              });
            });

    return AppBar(
      centerTitle: false,
      bottom: bottom,
      elevation:
          listScrolled || (bottom != null && hasScaffoldBody) ? 1.0 : 0.0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: getAppBarTitle(),
      ),
      toolbarHeight: appBarHeight ??
          (loftAppBarType == LoftAppBarType.withTitle && listScrolled
              ? kToolbarHeight - 16.0
              : null),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      (appBarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0.0));
}
