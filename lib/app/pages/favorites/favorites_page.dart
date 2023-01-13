import 'package:flutter/material.dart';
import 'package:loft/app/components/loft_empty_page_component.dart';
import 'package:loft/app/components/loft_outlined_button.dart';
import 'package:loft/app/pages/loft_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return LoftPage.withTitle(
      title: 'Favoritos',
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: kToolbarHeight),
            LoftEmptyPageComponent(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey[400],
                size: 60.0,
              ),
              title: 'Você ainda não tem nenhum \nimóvel favorito.',
              subtitle:
                  'Para salvar um imóvel é só clicar no ícone de coração e ele irá aparecer aqui.',
              actionButton: LoftOutlinedButton(
                label: 'Explorar imóveis',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
