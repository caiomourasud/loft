import 'package:flutter/material.dart';
import 'package:loft/app/components/loft-card-carousel/loft_neighborhood_card.dart';
import 'package:loft/app/models/carousel_card.dart';

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
  final maxWidth = 340.0;
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
          if (MediaQuery.of(context).size.width * 0.84 <= maxWidth)
            Expanded(
              child: PageView.builder(
                padEnds: false,
                controller: pageController,
                itemCount: widget.carouselCards.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: 20.0,
                      right: index == (widget.carouselCards.length - 1)
                          ? 20.0
                          : 0.0,
                    ),
                    child: LoftNeighborhoodCard(
                      carouselCard: widget.carouselCards[index],
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
                itemCount: widget.carouselCards.length,
                itemBuilder: (context, index) {
                  return Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    margin: EdgeInsets.symmetric(
                        horizontal: index != 0 &&
                                index != (widget.carouselCards.length - 1)
                            ? 20.0
                            : 0.0),
                    child: LoftNeighborhoodCard(
                      carouselCard: widget.carouselCards[index],
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
