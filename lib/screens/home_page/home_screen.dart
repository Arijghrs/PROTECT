import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect/data/data_repo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<Marker> markers = const <Marker>{};

  late GoogleMapController _controller;

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(35.503372524565506, 11.045832345890663),
    zoom: 10,
  );

  void goToLoyola(LatLng location) {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: location,
      tilt: 50.0,
      bearing: 45.0,
      zoom: 10.0,
    )));
  }

  @override
  void initState() {
    DataRepo().getPositionStream().listen((position) {
      final marker = Marker(
          markerId: MarkerId('1'), position: new LatLng(position.long, position.lat));
      markers = HashSet<Marker>()..add(marker);
      setState(() {
        goToLoyola(new LatLng(position.long, position.lat));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController googleMapController) {
          _controller = googleMapController;
        },
        markers: markers,
      );
}
