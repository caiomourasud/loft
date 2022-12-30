import 'package:flutter/material.dart';
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
      shrinkWrap: true,
      title: 'Favoritos',
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.grey[400],
                  size: 60.0,
                ),
                const SizedBox(height: 36.0),
                Text(
                  'Você ainda não tem nenhum \nimóvel favorito.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Para salvar um imóvel é só clicar no ícone de coração e ele irá aparecer aqui.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16.0),
                LoftOutlinedButton(
                  label: 'Explorar imóveis',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
