import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loft/app/components/loft-apartment-carousel/loft_apartment_carousel_item.dart';
import 'package:loft/app/models/apartment.dart';

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
  final maxWidth = 340.0;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        height: 1.0),
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
          if (MediaQuery.of(context).size.width * 0.84 <= maxWidth)
            Expanded(
              child: PageView.builder(
                padEnds: false,
                controller: pageController,
                itemCount: widget.apartments.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 20.0,
                        right: index == (widget.apartments.length - 1)
                            ? 20.0
                            : 0.0),
                    child: LoftApartmentCarouselItem(
                      apartment: widget.apartments[index],
                    ),
                  );
                },
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                scrollDirection: Axis.horizontal,
                itemCount: widget.apartments.length,
                itemBuilder: (context, index) {
                  return Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    margin: EdgeInsets.symmetric(
                        horizontal: index != 0 &&
                                index != (widget.apartments.length - 1)
                            ? 20.0
                            : 0.0),
                    child: LoftApartmentCarouselItem(
                      apartment: widget.apartments[index],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
