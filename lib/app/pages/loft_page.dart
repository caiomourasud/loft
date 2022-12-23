import 'package:flutter/material.dart';
import 'package:loft/app/components/loft_app_bar_content.dart';
import 'package:loft/app/components/loft_button.dart';

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

  final list = List<String>.generate(16, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    Widget title() => widget._title != null && widget._title != ''
        ? AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: listScrolled
                ? Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ) ??
                    const TextStyle()
                : Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ) ??
                    const TextStyle(),
            child: Text(
              widget._title!,
            ),
          )
        : LoftAppBarContent(
            showDropdown: widget._showCityDropdown,
            onDropdownTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  constraints: BoxConstraints(
                    minWidth: double.infinity,
                    maxHeight: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).viewPadding.top) -
                        36.0,
                  ),
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: Text(
                            'Onde você quer morar?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        Expanded(
                            child: ListView(
                          children: list
                              .map((e) => ListTile(
                                    title: Text(e),
                                  ))
                              .toList(),
                        )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Divider(color: Colors.grey, height: 1.0),
                            const SizedBox(height: 12.0),
                            const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: LoftButton(label: 'Selecionar cidade')),
                            const SizedBox(height: 12.0),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).viewPadding.bottom),
                          ],
                        )
                      ],
                    );
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
      body: ListView(controller: _scrollController, children: widget.children),
    );
  }
}
