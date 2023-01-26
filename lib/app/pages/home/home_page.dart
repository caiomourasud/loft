import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loft/app/components/loft-apartment-carousel/loft_apartment_carousel.dart';
import 'package:loft/app/components/loft-card-carousel/loft_card_carousel.dart';
import 'package:loft/app/components/loft_button.dart';
import 'package:loft/app/components/loft_empty_page_component.dart';
import 'package:loft/app/components/loft_outlined_button.dart';
import 'package:loft/app/models/apartment.dart';
import 'package:loft/app/models/carousel_card.dart';
import 'package:loft/app/pages/loft_page.dart';
import 'package:loft/app/themes/loft_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.scrollController, super.key});

  final ScrollController? scrollController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apartments = const [
    Apartment(
      id: 1,
      pictures: [
        'assets/apartments/apartment1/1.jpg',
        'assets/apartments/apartment1/2.jpg',
        'assets/apartments/apartment1/3.jpg',
      ],
      type: 1,
      price: 145.000,
      area: 47,
      address: 'Santa Adelaide, Cidade Tiradentes',
      roomNumbers: 2,
      carSpaces: 1,
      latLng: ApartmentLocation(45.510400, -122.657433),
    ),
    Apartment(
      id: 2,
      pictures: [
        'assets/apartments/apartment2/1.jpg',
        'assets/apartments/apartment2/2.jpg',
        'assets/apartments/apartment2/3.jpg',
      ],
      type: 1,
      price: 415.000,
      area: 72,
      address: 'das Lágrimas, Sacomã',
      roomNumbers: 3,
      carSpaces: 1,
      latLng: ApartmentLocation(45.530400, -122.667433),
    ),
    Apartment(
      id: 3,
      pictures: [
        'assets/apartments/apartment3/1.jpg',
        'assets/apartments/apartment3/2.jpg',
        'assets/apartments/apartment3/3.jpg',
      ],
      type: 2,
      price: 331.858,
      area: 90,
      address: 'Manoel Antônio Pinto, Vila Andrade',
      roomNumbers: 3,
      carSpaces: 2,
      latLng: ApartmentLocation(45.510400, -122.617433),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LoftPage.noTitle(
      onPullToRefresh: () async {
        return await Future.delayed(const Duration(seconds: 2), () {});
      },
      children: [
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A casa é sua, pode entrar',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
              Text(
                'Comece a explorar',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32.0),
        LoftApartmentCarousel(
          title: 'Com academia pra treinar',
          apartments: apartments,
        ),
        const SizedBox(height: 32.0),
        const LoftCardCarousel(
          title: 'Bairros mais procurados',
          carouselCards: [
            CarouselCard(title: 'Pinheiros', subtitle: '36.073 buscas'),
            CarouselCard(title: 'Perdizes', subtitle: '28.576 buscas'),
            CarouselCard(title: 'Vila Mariana', subtitle: '24.033 buscas')
          ],
        ),
        const SizedBox(height: 32.0),
        LoftApartmentCarousel(
          title: 'Com vaga na garagem',
          apartments: apartments.reversed.toList(),
        ),
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.brown[50],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LoftEmptyPageComponent(
                padding: EdgeInsets.zero,
                textAlign: TextAlign.left,
                icon: SvgPicture.asset(
                  'assets/logos/loft_simple.svg',
                  color: Colors.grey[900],
                  height: 24.0,
                ),
                title: 'Venda seu imóvel rápido e sem burocracia',
                subtitle:
                    'Anuncie grátis, com fotos profissionais e apoio de especialistas.',
                actionButton: LoftOutlinedButton(
                  loftButtonSize: LoftButtonSize.small,
                  label: 'Anunciar meu imóvel',
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32.0),
        LoftApartmentCarousel(
          title: 'Área verde pra curtir a natureza',
          apartments: apartments,
        ),
        const SizedBox(height: 32.0),
        LoftApartmentCarousel(
          title: 'Para curtir o verão na piscina',
          apartments: apartments.reversed.toList(),
        ),
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  const SizedBox(width: 16.0),
                  Icon(
                    Icons.search,
                    color: LoftTheme.colorCustom,
                    size: 30,
                  ),
                  const SizedBox(width: 16.0),
                  const Expanded(child: Divider())
                ],
              ),
              const SizedBox(height: 16.0),
              LoftEmptyPageComponent(
                isActionButtonExpanded: true,
                title: 'Continue sua busca pelo lar ideal',
                subtitle:
                    'Busque e filtre por rua, avenida, condomínio e agende sua visita.',
                actionButton: LoftButton(
                  label: 'Buscar imóveis',
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}
