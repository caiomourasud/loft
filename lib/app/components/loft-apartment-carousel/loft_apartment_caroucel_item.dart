import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loft/app/components/loft-apartment-carousel/loft_image_carousel.dart';
import 'package:loft/app/models/apartment.dart';
import 'package:loft/app/services/apartment_service.dart';

final _apartmentService = ApartmentService();

class LoftApartmentCaroucelItem extends StatelessWidget {
  const LoftApartmentCaroucelItem({
    required this.apartment,
    this.isTheLastItem = false,
    super.key,
  });

  final Apartment apartment;
  final bool isTheLastItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.0, right: isTheLastItem == true ? 20.0 : 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8.0),
          LoftImageCarousel(images: apartment.pictures),
          const SizedBox(height: 16.0),
          Text(
            _apartmentService.getTypeByTypeId(apartment.type),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[700],
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'R\$ ${apartment.price.toStringAsFixed(3)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                width: 28,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    apartment.isFavorite == true
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    size: 28,
                    color: apartment.isFavorite == true
                        ? Colors.red[700]
                        : Colors.grey[900],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Text(
            apartment.address,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[700],
                ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.rotate(
                    angle: 1.5,
                    child: Icon(
                      CupertinoIcons.fullscreen,
                      size: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${apartment.area}m2',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[700],
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.bed_double,
                    size: 14,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${apartment.roomNumbers}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[700],
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.car_detailed,
                    size: 14,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${apartment.carSpaces}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[700],
                        ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
