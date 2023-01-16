import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:loft/app/components/loft_app_bar.dart';
import 'package:loft/app/models/city.dart';

class LoftPage extends StatefulWidget {
  const LoftPage.withTitle({
    this.children,
    String? title,
    this.body,
    this.scrollController,
    this.appBarBottom,
    this.onPullToRefresh,
    this.appBarHeight,
    super.key,
  })  : _title = title,
        _showCityDropdown = false,
        _loftAppBarType = LoftAppBarType.withTitle;

  const LoftPage.noTitle({
    this.children,
    bool showCityDropdown = true,
    this.body,
    this.scrollController,
    this.appBarBottom,
    this.onPullToRefresh,
    this.appBarHeight,
    super.key,
  })  : _showCityDropdown = showCityDropdown,
        _title = null,
        _loftAppBarType = LoftAppBarType.noTitle;

  final ScrollController? scrollController;
  final PreferredSizeWidget? appBarBottom;
  final Function()? onPullToRefresh;

  final List<Widget>? children;
  final Widget? body;
  final bool _showCityDropdown;
  final String? _title;
  final LoftAppBarType? _loftAppBarType;
  final double? appBarHeight;

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
    Widget scaffold = KeyboardDismissOnTap(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: LoftAppBar(
            title: widget._title,
            loftAppBarType: widget._loftAppBarType,
            bottom: widget.appBarBottom,
            listScrolled: listScrolled,
            showCityDropdown: widget._showCityDropdown,
            appBarHeight: widget.appBarHeight,
            selectedCity: selectedCity,
            onCitySelected: (city) {
              setState(() => selectedCity = city);
            },
          ),
          body: widget.body ??
              Center(
                child: ListView(
                  controller: _scrollController,
                  children: widget.children ?? [],
                ),
              )),
    );

    return widget.onPullToRefresh == null
        ? scaffold
        : RefreshIndicator(
            displacement: MediaQuery.of(context).viewPadding.top + 8.0,
            onRefresh: () => widget.onPullToRefresh?.call(),
            child: scaffold,
          );
  }
}
