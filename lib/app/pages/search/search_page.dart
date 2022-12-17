import 'package:flutter/material.dart';
import 'package:loft/app/components/logo_tab_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: LogoTabBar(),
          )
        ],
      ),
    );
  }
}
