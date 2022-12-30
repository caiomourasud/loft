class ApartmentService {
  String getTypeByTypeId(int typeId) {
    switch (typeId) {
      case 1:
        return 'Apartamento';
      case 2:
        return 'Casa';
      default:
        return 'Apartamento';
    }
  }
}
