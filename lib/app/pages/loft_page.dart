import 'package:flutter/material.dart';
import 'package:loft/app/components/loft_app_bar_content.dart';
import 'package:loft/app/components/select_city_modal.dart';
import 'package:loft/app/models/city.dart';

enum LoftAppBarType {
  withTitle,
  noTitle,
}

class LoftPage extends StatefulWidget {
  const LoftPage.withTitle({
    required this.children,
    this.scrollController,
    this.appBarBottom,
    String? title,
    super.key,
  })  : _title = title,
        _showCityDropdown = false,
        _loftAppBarType = LoftAppBarType.withTitle;

  const LoftPage.noTitle({
    required this.children,
    this.scrollController,
    this.appBarBottom,
    bool showCityDropdown = true,
    super.key,
  })  : _showCityDropdown = showCityDropdown,
        _title = null,
        _loftAppBarType = LoftAppBarType.noTitle;

  final List<Widget> children;
  final ScrollController? scrollController;
  final PreferredSizeWidget? appBarBottom;

  final bool _showCityDropdown;
  final String? _title;
  final LoftAppBarType? _loftAppBarType;

  @override
  State<LoftPage> createState() => _LoftPageState();
}

class _LoftPageState extends State<LoftPage> {
  late ScrollController _scrollController;
  bool listScrolled = false;
  City? selectedCity = const City(id: 0, name: 'São Paulo');

  @override
  void initState() {
    if (widget.scrollController != null) {
      _scrollController = widget.scrollController!;
    } else {
      _scrollController = ScrollController();
    }
    _scrollController.addListener(onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    super.dispose();
  }

  void onScroll() {
    if (_scrollController.position.pixels > 0.0 && listScrolled == false) {
      setState(() => listScrolled = true);
    }
    if (_scrollController.position.pixels <= 0.0 && listScrolled == true) {
      setState(() => listScrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget title() => widget._title != null && widget._title != ''
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
              widget._title!,
            ),
          )
        : LoftAppBarContent(
            cityName: selectedCity?.name ?? 'São Paulo',
            showDropdown: widget._showCityDropdown,
            onDropdownTap: () {
              SelectCityModal.show(context, selectedCity: selectedCity,
                  onCitySelected: (city) {
                setState(() => selectedCity = city);
                Navigator.pop(context);
              });
            },
          );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        bottom: widget.appBarBottom,
        elevation: listScrolled ? 1.0 : 0.0,
        backgroundColor: Colors.white,
        title: title(),
        toolbarHeight:
            widget._loftAppBarType == LoftAppBarType.withTitle && listScrolled
                ? kToolbarHeight - 16.0
                : null,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          controller: _scrollController,
          children: widget.children,
        ),
      ),
    );
  }
}
