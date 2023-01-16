import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loft/app/components/loft-apartment-carousel/loft_apartment_carousel_item.dart';
import 'package:loft/app/components/loft_app_bar.dart';
import 'package:loft/app/models/apartment.dart';
import 'package:loft/app/models/city.dart';
import 'package:loft/app/components/loft_chip.dart';
import 'package:loft/app/pages/search/components/map_list_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late DraggableScrollableController draggableScrollableController;
  late GoogleMapController mapController;
  // final _center = const LatLng(45.521563, -122.677433);
  LatLng target = const LatLng(45.521563, -122.677433);
  bool showList = true;
  bool isDraggableScrollSheetOpenned = false;
  bool isDraggableScrollSheetOnMiddle = false;
  String searchPlaceholder = 'Busque por bairro';

  City? selectedCity = const City(id: 0, name: 'São Paulo');

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        // target = LatLng(position.longitude, position.latitude);
        // mapController.animateCamera(CameraUpdate.newCameraPosition(
        //   CameraPosition(
        //     bearing: 0,
        //     target: LatLng(position.latitude, position.longitude),
        //     zoom: 13.0,
        //   ),
        // ));
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      debugPrint('Location permissions are permanently '
          'denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  @override
  void initState() {
    _getSearchPlaceholder();
    _handleLocationPermission();
    _getCurrentPosition();
    draggableScrollableController = DraggableScrollableController();
    draggableScrollableController.addListener(() {
      if (draggableScrollableController.pixels ==
              draggableScrollableController.sizeToPixels(1.0) &&
          !isDraggableScrollSheetOpenned) {
        setState(() {
          isDraggableScrollSheetOpenned = true;
        });
      } else if (isDraggableScrollSheetOpenned) {
        setState(() {
          isDraggableScrollSheetOpenned = false;
        });
      }
      if (draggableScrollableController.pixels >=
          draggableScrollableController.sizeToPixels(0.5)) {
        if (!isDraggableScrollSheetOnMiddle) {
          setState(() {
            isDraggableScrollSheetOnMiddle = true;
          });
        }
      } else if (isDraggableScrollSheetOnMiddle) {
        setState(() {
          isDraggableScrollSheetOnMiddle = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    draggableScrollableController.removeListener(() {});
    super.dispose();
  }

  Future<void> _getSearchPlaceholder() async {
    List<String> list = ['bairro', 'rua', 'avenida', 'condomínio'];
    String searchString = 'Busque por';
    int count = 0;
    while (count >= 0) {
      if (count == list.length - 1) {
        count = 0;
      } else {
        count++;
      }
      await Future.delayed(const Duration(seconds: 4));
      setState(() {
        searchPlaceholder = '$searchString ${list[count]}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const apartments = [
      Apartment(
        id: 1,
        pictures: [
          'https://resizedimgs.zapimoveis.com.br/fit-in/800x360/named.images.sp/b09ad4651460a70ddd59cdaa04ea8f77/apartamento-com-4-quartos-para-alugar-108m-no-parque-amazonia-goiania.jpg',
          'https://resizedimgs.zapimoveis.com.br/fit-in/800x360/named.images.sp/164946e92da5c8fcc235cc8c0b343d1c/apartamento-com-4-quartos-para-alugar-108m-no-parque-amazonia-goiania.jpg',
          'https://resizedimgs.zapimoveis.com.br/fit-in/800x360/named.images.sp/bae10e2bd4a4a9ea9ffeb50b56f96cc1/apartamento-com-4-quartos-para-alugar-108m-no-parque-amazonia-goiania.jpg',
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
          'https://imgbr.imovelwebcdn.com/avisos/2/29/70/32/65/19/360x266/3502000390.jpg',
          'https://imgbr.imovelwebcdn.com/avisos/2/29/70/32/65/19/360x266/3502000400.jpg',
          'https://imgbr.imovelwebcdn.com/avisos/2/29/70/32/65/19/360x266/3502000381.jpg'
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
          'https://imgbr.imovelwebcdn.com/avisos/2/29/69/35/47/72/720x532/3455778032.jpg',
          'https://imgbr.imovelwebcdn.com/avisos/2/29/69/35/47/72/720x532/3455778040.jpg',
          'https://imgbr.imovelwebcdn.com/avisos/2/29/69/35/47/72/720x532/3455778074.jpg'
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

    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  // myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: target,
                    zoom: 13.0,
                  ),
                  markers: {
                    ...apartments.map((apartment) => Marker(
                        markerId: MarkerId('${apartment.id}'),
                        position: LatLng(apartment.latLng.latitude,
                            apartment.latLng.longitude))),
                  },
                ),
                if (showList)
                  DraggableScrollableSheet(
                    controller: draggableScrollableController,
                    initialChildSize: 0.33,
                    minChildSize: 0.33,
                    builder: (context, controller) {
                      return Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          if (isDraggableScrollSheetOpenned)
                            Container(
                              color: Colors.white,
                              height: constraints.maxHeight / 1.35,
                            ),
                          ListView(
                            controller: controller,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(32.0),
                                      topRight: Radius.circular(32.0)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 4.0,
                                        width: 32.0,
                                        margin: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4.0),
                                          ),
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            '${apartments.length}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                    TextSpan(
                                                        text:
                                                            apartments.length >
                                                                    1
                                                                ? ' imóveis'
                                                                : ' imóvel'),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 4.0),
                                              Text('São Paulo, SP',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall)
                                            ],
                                          ),
                                          const LoftChip.outlined(
                                              label: 'Ordenar')
                                        ],
                                      ),
                                      Column(
                                        children: apartments
                                            .map(
                                              (apartment) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                ),
                                                child:
                                                    LoftApartmentCarouselItem(
                                                  apartment: apartment,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      const SizedBox(height: 60.0),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                MapListButton(
                    showList: showList,
                    onTap: () {
                      setState(() {
                        showList = !showList;
                        isDraggableScrollSheetOpenned = false;
                      });
                    }),
              ],
            );
          }),
          SizedBox(
            height: isDraggableScrollSheetOnMiddle ||
                    isDraggableScrollSheetOpenned
                ? (kToolbarHeight * 2) + MediaQuery.of(context).viewPadding.top
                : (kToolbarHeight * 3) + MediaQuery.of(context).viewPadding.top,
            child: LoftAppBar(
              appBarHeight: isDraggableScrollSheetOnMiddle ||
                      isDraggableScrollSheetOpenned
                  ? 0.0
                  : null,
              selectedCity: selectedCity,
              onCitySelected: (city) {
                setState(() {
                  selectedCity = city;
                });
              },
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: kToolbarHeight,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CupertinoSearchTextField(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kToolbarHeight),
                            color: Colors.grey[100],
                            border: Border.all(color: Colors.grey.shade400)),
                        prefixInsets: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0, 8.0, 4),
                        placeholder: searchPlaceholder,
                      ),
                    ),
                    Container(
                      height: kToolbarHeight,
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        children: const [
                          LoftChip(
                            label: 'Filtrar',
                            icon: CupertinoIcons.slider_horizontal_3,
                          ),
                          LoftChip.outlined(label: 'Preço'),
                          LoftChip.outlined(label: 'Cômodos'),
                          LoftChip.outlined(label: 'Metragem'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
