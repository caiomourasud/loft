import 'package:flutter/material.dart';
import 'package:loft/app/pages/loft_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final list = List<String>.generate(100, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return LoftPage.withTitle(
      title: 'Favoritos',
      children: list
          .map((e) => ListTile(
                title: Text(e),
              ))
          .toList(),
    );
  }
}
