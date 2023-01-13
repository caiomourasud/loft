import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  final _center = const LatLng(45.521563, -122.677433);
  LatLng? target;

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
        target = LatLng(position.longitude, position.latitude);
        mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: LatLng(position.latitude, position.longitude),
            zoom: 13.0,
          ),
        ));
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
                placeholder: 'Busque por avenida',
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
              target: target ?? _center,
              zoom: 11.0,
            ),
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
