import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loft/app/components/loft-apartment-carousel/loft_apartment_caroucel_item.dart';
import 'package:loft/app/models/apartment.dart';
import 'package:collection/collection.dart';

class LoftApartmentCarousel extends StatefulWidget {
  const LoftApartmentCarousel({
    required this.title,
    required this.apartments,
    this.onSeeAllPressed,
    super.key,
  });

  final String title;
  final List<Apartment> apartments;
  final Function()? onSeeAllPressed;

  @override
  State<LoftApartmentCarousel> createState() => _LoftApartmentCarouselState();
}

class _LoftApartmentCarouselState extends State<LoftApartmentCarousel> {
  final pageController = PageController(viewportFraction: 0.84);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 348,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    'Ver todos',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.teal[700]),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              padEnds: false,
              controller: pageController,
              children: [
                ...widget.apartments
                    .mapIndexed((index, apartment) => LoftApartmentCaroucelItem(
                          apartment: apartment,
                          isTheLastItem:
                              index == (widget.apartments.length - 1),
                        ))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
