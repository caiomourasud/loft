import 'package:flutter/material.dart';
import 'package:loft/app/pages/initial_page.dart';
import 'package:loft/app/themes/loft_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loft Clone App',
      theme: ThemeData(
        primarySwatch: LoftTheme.colorCustom,
      ),
      home: const InitialPage(),
    );
  }
}
