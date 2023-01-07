import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:loft/app/themes/loft_theme.dart';

class LoftImageCarousel extends StatefulWidget {
  const LoftImageCarousel({
    required this.images,
    super.key,
  });

  final List<String> images;

  @override
  State<LoftImageCarousel> createState() => _LoftImageCarouselState();
}

class _LoftImageCarouselState extends State<LoftImageCarousel> {
  final pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: LoftTheme.colorCustom,
      clipBehavior: Clip.hardEdge,
      elevation: 0.0,
      child: SizedBox(
        height: 180,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            PageView(
              padEnds: false,
              controller: pageController,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: widget.images
                  .map((picture) => Image.network(picture, fit: BoxFit.cover))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.mapIndexed((index, image) {
                final isSelected = currentPage == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 4.0,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: isSelected ? 12.0 : 8.0,
                    child: CircleAvatar(
                      backgroundColor:
                          isSelected ? Colors.grey[200] : Colors.grey,
                      radius: isSelected ? 6.0 : 4.0,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
