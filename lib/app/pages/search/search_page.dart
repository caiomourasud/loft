import 'package:flutter/material.dart';
import 'package:loft/app/pages/loft_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
