import 'package:flutter/material.dart';
import 'package:loft/app/pages/loft_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.scrollController, super.key});

  final ScrollController? scrollController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = List<String>.generate(100, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return LoftPage.noTitle(
      children: list
          .map((e) => ListTile(
                title: Text(e),
              ))
          .toList(),
    );
  }
}
