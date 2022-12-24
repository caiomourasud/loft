import 'package:flutter/material.dart';
import 'package:loft/app/components/loft_button.dart';
import 'package:loft/app/components/loft_profile_section.dart';
import 'package:loft/app/pages/loft_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PreferredSizeWidget get bottom => PreferredSize(
      preferredSize: const Size.fromHeight(152.0),
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
            const SizedBox(height: 16.0),
            LoftButton(
              label: 'Entrar',
              onPressed: () {},
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return LoftPage.noTitle(
      showCityDropdown: false,
      appBarBottom: bottom,
      children: [
        const SizedBox(height: 16.0),
        LoftProfileSection(
          label: 'Comprar',
          items: [
            ProfileSectionItem(title: 'Simulador de Compra', onTap: () {}),
          ],
        ),
        const SizedBox(height: 16.0),
        LoftProfileSection(
          label: 'Crédito',
          items: [
            ProfileSectionItem(title: 'Financiamento', onTap: () {}),
            ProfileSectionItem(title: 'Crédito com Garantia', onTap: () {}),
            ProfileSectionItem(title: 'Parcerias', onTap: () {}),
          ],
        ),
        const SizedBox(height: 16.0),
        LoftProfileSection(
          label: 'Vender',
          items: [
            ProfileSectionItem(title: 'Anunciar Imóvel', onTap: () {}),
            ProfileSectionItem(title: 'Como Vender na Loft', onTap: () {}),
          ],
        ),
        const SizedBox(height: 16.0),
        LoftProfileSection(
          label: 'Loft',
          items: [
            ProfileSectionItem(title: 'Central de Ajuda', onTap: () {}),
            ProfileSectionItem(title: 'Assessoria Imobiliária', onTap: () {}),
            ProfileSectionItem(title: 'Corretores', onTap: () {}),
            ProfileSectionItem(title: 'Como Funciona', onTap: () {}),
            ProfileSectionItem(title: 'Quem somos', onTap: () {}),
          ],
        ),
        const SizedBox(height: 16.0),
        LoftProfileSection(
          label: 'Políticas',
          items: [
            ProfileSectionItem(title: 'Alô Compliance', onTap: () {}),
            ProfileSectionItem(title: 'Política de Privacidade', onTap: () {}),
            ProfileSectionItem(
                title: 'Termos e Confiçōes de Uso', onTap: () {}),
            ProfileSectionItem(title: 'Guia de Conduta e Ética', onTap: () {}),
          ],
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}
