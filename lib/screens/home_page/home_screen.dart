import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect/constants.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*var markers = HashSet<Marker>();

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.886917, 9.537499),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(),
          Container(
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (GoogleMapController googleMapController){
                setState(() {
                  markers.add(Marker(markerId: MarkerId('1'),
                    position: LatLng(33.886917, 9.537499),),);
                });
              },
             /* mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(33.886917, 9.537499),
              ),*/
            ),
          )
        ],
      ),
    );
  }
}*/










  var markers = HashSet<Marker>();

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.886917, 9.537499),
    zoom: 10,
  );


  @override
  Widget build(BuildContext context)
  => Scaffold(
    appBar: AppBar(
      //title: Text('Home', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15.0),),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      /*leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: () {},
      ),*/
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(8),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Search location',suffixIcon: Icon(Icons.search)),
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,


    ),


    body: Stack(
      children: [
        GoogleMap(
          //zoomControlsEnabled: false,
          //myLocationButtonEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController googleMapController){
            setState(() {
              markers.add(Marker(markerId: MarkerId('1'),
                  position: LatLng(33.886917, 9.537499),),);
            });
          },
          markers: markers,
        ),
      ],
    )
   );
}

/*class AddressInput extends StatelessWidget {
  final IconData iconData;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/


