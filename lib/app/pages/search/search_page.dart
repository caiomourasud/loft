import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loft/app/components/loft-apartment-carousel/loft_apartment_carousel_item.dart';
import 'package:loft/app/models/apartment.dart';
import 'package:loft/app/pages/loft_page.dart';
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
  late GoogleMapController mapController;
  // final _center = const LatLng(45.521563, -122.677433);
  LatLng target = const LatLng(45.521563, -122.677433);

  bool showList = true;

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
    _handleLocationPermission();
    _getCurrentPosition();
    super.initState();
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
      ),
    ];

    return LoftPage.noTitle(
      appBarBottom: PreferredSize(
        preferredSize: const Size.fromHeight((kToolbarHeight * 2) + 16.0),
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
                prefixInsets:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 0, 8.0, 4),
                placeholder:
                    'Busque por avenida', // bairro, rua, avenida, condomínio
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
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            // myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: target,
              zoom: 13.0,
            ),
            markers: {
              const Marker(
                markerId: MarkerId('1'),
                position: LatLng(45.520400, -122.647433),
              ),
              const Marker(
                markerId: MarkerId('2'),
                position: LatLng(45.521563, -122.677433),
              ),
            },
          ),
          if (showList)
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              builder: (context, controller) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)),
                    color: Colors.white,
                  ),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    controller: controller,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0)),
                          color: Colors.white,
                        ),
                        // height: MediaQuery.of(context).size.height,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                                text: '55.837',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                            const TextSpan(text: ' imóveis'),
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
                                  const LoftChip.outlined(label: 'Ordenar')
                                ],
                              ),
                              Column(
                                children: apartments
                                    .map(
                                      (apartment) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: LoftApartmentCarouselItem(
                                          apartment: apartment,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Column(
                                children: apartments
                                    .map(
                                      (apartment) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: LoftApartmentCarouselItem(
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
                );
              },
            ),
          MapListButton(
              showList: showList,
              onTap: () {
                setState(() {
                  showList = !showList;
                });
              }),
        ],
      ),
    );
  }
}
