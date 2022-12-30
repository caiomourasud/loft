import 'package:flutter/material.dart';
import 'package:loft/app/models/carousel_card.dart';
import 'package:collection/collection.dart';

class LoftCardCarousel extends StatefulWidget {
  const LoftCardCarousel({
    required this.title,
    required this.carouselCards,
    super.key,
  });

  final String title;
  final List<CarouselCard> carouselCards;

  @override
  State<LoftCardCarousel> createState() => _LoftApartmentCarouselState();
}

class _LoftApartmentCarouselState extends State<LoftCardCarousel> {
  final pageController = PageController(viewportFraction: 0.84);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          const SizedBox(height: 8.0),
          Expanded(
            child: PageView(
              padEnds: false,
              controller: pageController,
              children: widget.carouselCards
                  .mapIndexed((index, carouselCard) => Padding(
                        padding: EdgeInsets.only(
                            left: 20.0,
                            right: index == (widget.carouselCards.length - 1)
                                ? 20.0
                                : 0.0),
                        child: Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.teal,
                          elevation: 0.0,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(carouselCard.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )),
                                      const SizedBox(height: 8.0),
                                      Text(carouselCard.subtitle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Colors.white,
                                              )),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
