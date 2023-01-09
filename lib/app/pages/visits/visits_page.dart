import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loft/app/components/loft_button.dart';
import 'package:loft/app/components/loft_empty_page_component.dart';
import 'package:loft/app/components/loft_tab_bar_indicator.dart';
import 'package:loft/app/pages/loft_page.dart';
import 'package:loft/app/themes/loft_theme.dart';

class VisitsPage extends StatefulWidget {
  const VisitsPage({super.key});

  @override
  State<VisitsPage> createState() => _VisitsPageState();
}

class _VisitsPageState extends State<VisitsPage> with TickerProviderStateMixin {
  late TabController _tabsController;

  final list = List<String>.generate(100, (i) => 'Item ${i + 1}');

  @override
  void initState() {
    _tabsController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoftPage.withTitle(
      shrinkWrap: true,
      title: 'Minhas visitas',
      appBarBottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: Colors.white,
              child: Row(
                children: [
                  TabBar(
                    controller: _tabsController,
                    isScrollable: true,
                    indicator: LoftTabBarIndicator(
                      indicatorColor: LoftTheme.colorCustom,
                      indicatorHeight: 4.0,
                    ),
                    tabs: const [
                      Tab(text: 'Agendadas'),
                      Tab(text: 'Histórico'),
                    ],
                  ),
                ],
              ))),
      children: [
        LoftEmptyPageComponent(
          icon: Icon(
            CupertinoIcons.calendar_today,
            color: LoftTheme.colorCustom,
            size: 60.0,
          ),
          title: 'A casa é sua pode entrar.',
          subtitle:
              'Crie ou acesse sua conta para agendar visitas gratuitas e sem compromisso.',
          actionButton: LoftButton(
            label: 'Acessar conta',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
