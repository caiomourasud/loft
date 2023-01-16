class ApartmentLocation {
  const ApartmentLocation(this.latitude, this.longitude);
  final double latitude;
  final double longitude;
}

class Apartment {
  const Apartment({
    required this.id,
    required this.pictures,
    required this.type,
    required this.price,
    required this.area,
    required this.address,
    required this.roomNumbers,
    required this.carSpaces,
    required this.latLng,
    this.isFavorite,
  });

  final int id;
  final List<String> pictures;
  final int type;
  final double price;
  final double area;
  final String address;
  final int roomNumbers;
  final int carSpaces;
  final bool? isFavorite;
  final ApartmentLocation latLng;
}
