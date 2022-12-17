import 'package:flutter/cupertino.dart';
import 'package:loft/app/models/bottom_navigation_bar_item_model.dart';
import 'package:loft/app/pages/favorites/favorites_page.dart';
import 'package:loft/app/pages/home/home_page.dart';
import 'package:loft/app/pages/profile/profile_page.dart';
import 'package:loft/app/pages/search/search_page.dart';
import 'package:loft/app/pages/visits/visits_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final tabs = const [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
    VisitsPage(),
    ProfilePage(),
  ];

  final items = const [
    BottomNavigationBarItemModel(
        iconData: CupertinoIcons.home, label: 'Início'),
    BottomNavigationBarItemModel(
        iconData: CupertinoIcons.search, label: 'Buscar'),
    BottomNavigationBarItemModel(
        iconData: CupertinoIcons.heart, label: 'Favoritos'),
    BottomNavigationBarItemModel(
        iconData: CupertinoIcons.calendar_today, label: 'Visitas'),
    BottomNavigationBarItemModel(
        iconData: CupertinoIcons.person, label: 'Perfil'),
  ];

  BottomNavigationBarItem _customBottomNavigationBarItem({
    required IconData iconData,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(iconData, size: 20),
      label: label,
      tooltip: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          items: items.map(
        (item) {
          return _customBottomNavigationBarItem(
            iconData: item.iconData,
            label: item.label,
          );
        },
      ).toList()),
      tabBuilder: (context, index) {
        return tabs[index];
      },
    );
  }
}
