import 'package:flutter/material.dart';
import 'package:loft/app/pages/loft_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final list = List<String>.generate(100, (i) => 'Item ${i + 1}');

  PreferredSizeWidget get bottom => PreferredSize(
      preferredSize: const Size.fromHeight(132.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0),
            Text(
              'Olá!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4.0),
            const Text('Entre ou se cadastre para salvar seus imóveis'
                ' favoritos e agendar visitas.'),
            const SizedBox(height: 4.0),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  overlayColor:
                      MaterialStateProperty.all(const Color(0xFFEB673B)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {},
                child: const Text('Entrar')),
            const SizedBox(height: 8.0),
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return LoftPage.noTitle(
      showCityDropdown: false,
      appBarBottom: bottom,
      children: list
          .map((e) => ListTile(
                title: Text(e),
              ))
          .toList(),
    );
  }
}
