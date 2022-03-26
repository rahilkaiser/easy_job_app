import 'dart:async';
import 'dart:collection';
import 'dart:math' as math;

import 'package:easy_job_app/constants.dart';
import 'package:easy_job_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../models/Suggestion.dart';
import 'components/address_search.dart';

class MapScreen extends StatefulWidget {
  static String routeName = "/map";

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng currentPosLatLng = LatLng(0, 0);
  late CameraPosition currentCameraPos;
  double _rad = 400;
  final double _zoomLevel = 11;
  late GoogleMapController _mapController;

  final Set<Marker> _markers = HashSet<Marker>();
  final Set<Circle> _circles = HashSet<Circle>();

  final TextEditingController _textEditingController = TextEditingController();

  void _setMarkers({required LatLng pos}) {
    if (_markers.isNotEmpty) _markers.clear();

    _markers.add(
      Marker(
        markerId: MarkerId("0"),
        position: pos,
      ),
    );
  }

  void _setCircles({required LatLng centerPos, required double radius}) {
    _rad = radius;
    if (_circles.isNotEmpty) _circles.clear();
    _circles.add(
      Circle(
        circleId: CircleId("0"),
        center: centerPos,
        radius: radius,
        strokeWidth: 1,
        fillColor: kErrorColor.withOpacity(0.2),
      ),
    );
  }

  void _adjustZoomLevel() {
    double zoomLevel = 11;
    if (_rad > 0) {
      double radiusElevated = _rad + _rad / 2;
      double scale = radiusElevated / 400;
      zoomLevel = 16 - math.log(scale) / math.log(2);
    }
    zoomLevel = double.parse(zoomLevel.toStringAsFixed(2));
    currentCameraPos =
        CameraPosition(target: currentPosLatLng, zoom: zoomLevel);
  }

  void _locatePositionByName(String address) async {
    List<Location> locations = await locationFromAddress(address);

    this._relocateCurrentPosition(
      LatLng(locations[0].latitude, locations[0].longitude),
    );
  }

  void _locateMyPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    this._relocateCurrentPosition(
        LatLng(pos.latitude, pos.longitude)
    );
  }

  Future<void> _relocateCurrentPosition(LatLng newPos) async {
    currentPosLatLng = LatLng(newPos.latitude, newPos.longitude);
    currentCameraPos = CameraPosition(target: currentPosLatLng, zoom: _zoomLevel);

    List<Placemark> placeMarks = await placemarkFromCoordinates(
        currentPosLatLng.latitude,
        currentPosLatLng.longitude
    );

    setState(() {
      this._setMarkers(pos: currentPosLatLng);
      this._setCircles(centerPos: currentPosLatLng, radius: _rad);
      this._adjustZoomLevel();
      _textEditingController.text =
          '${placeMarks[0].thoroughfare} ${placeMarks[0].subThoroughfare}, ${placeMarks[0].locality}, ${placeMarks[0].country}';
      }
    );

    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(currentCameraPos),
    );
  }

  void _onMapCreated(GoogleMapController gController) {
    _mapController = gController;

    this._locateMyPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Row(
              children: const [
                Icon(
                  Icons.check,
                  color: kPrimaryColor,
                ),
                Text(
                  "Fertig",
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target: currentPosLatLng),
            onMapCreated: _onMapCreated,
            markers: _markers,
            circles: _circles,
            zoomControlsEnabled: false,
            onTap: (LatLng loc) {
              this._relocateCurrentPosition(loc);
            },
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(350),
                    child: TextField(
                      readOnly: true,
                      controller: _textEditingController,
                      onTap: () async {
                        //EDIt
                        final sessionToken = Uuid().v4();

                        final Suggestion? result = await showSearch(
                          query: _textEditingController.text,
                          context: context,
                          delegate: AddressSearch(sessionToken),
                        ) as Suggestion;

                        if (result != null) {
                          // final placeDetails =
                          //     await PlaceApiProvider(sessionToken)
                          //         .getPlaceDetailFromId(result.placeId);

                          _textEditingController.text = result.description;
                          this._locatePositionByName(
                              _textEditingController.text);
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: kTextColor,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: getProportionateScreenWidth(350),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 5),
                            child: Text('Umkreis: ${(_rad / 1000).round()} km'),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor:
                                  kPrimaryColor.withOpacity(0.2),
                              // Custom Gray Color
                              activeTrackColor: kPrimaryColor,
                              thumbColor: kPrimaryColor,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20.0),
                            ),
                            child: Slider(
                              min: 40,
                              max: 200000,
                              value: _rad,
                              onChanged: (value) {
                                setState(() {
                                  this._setCircles(
                                      centerPos: currentPosLatLng,
                                      radius: value
                                  );
                                  this._adjustZoomLevel();
                                  _mapController.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        currentCameraPos),
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this._locateMyPosition();
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.my_location_outlined,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this._locateMyPosition();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _mapController.dispose();
    super.dispose();
  }
}
