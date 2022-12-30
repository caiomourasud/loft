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
}
