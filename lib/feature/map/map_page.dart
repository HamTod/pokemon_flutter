import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon2/store/user_store.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  Set<Marker> markers = <Marker>{};
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map page'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? north, south, east, west;
    for (LatLng latLng in list) {
      if (north == null || latLng.latitude > north) {
        north = latLng.latitude;
      }
      if (south == null || latLng.latitude < south) {
        south = latLng.latitude;
      }
      if (east == null || latLng.longitude > east) {
        east = latLng.longitude;
      }
      if (west == null || latLng.longitude < west) {
        west = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(north!, east!), southwest: LatLng(south!, west!));
  }

  Future<void> fitBounds() async {
    if (markers.isNotEmpty) {
      LatLngBounds bounds = _boundsFromLatLngList(
          markers.map((marker) => marker.position).toList());
      _controller.future.then((controller) =>
          controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50)));
    }
  }

  Future<Uint8List> _getMarkerImageDataFromNetwork(String imageURL) async {
    final Completer<Uint8List> completer = Completer();
    await http.get(Uri.parse(imageURL)).then((http.Response response) {
      if (response.statusCode == 200) {
        final Uint8List bytes = response.bodyBytes;
        completer.complete(bytes);
      } else {
        completer.completeError('Error ${response.statusCode}');
      }
    });
    return completer.future;
  }


  Future<BitmapDescriptor> _getMarkerImageFromNetwork(String imageURL) async {
    final Completer<BitmapDescriptor> completer = Completer();
    final Uint8List markerImageData =
    await _getMarkerImageDataFromNetwork(imageURL);

    final bitmap = BitmapDescriptor.fromBytes(markerImageData);
    completer.complete(bitmap);
    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final userStore = Provider.of<UserStore>(context, listen: false);

      for (var user in userStore.userList) {
        final BitmapDescriptor networkImage =
        await _getMarkerImageFromNetwork(user.avatar);
        setState(() {
          markers.add(Marker(
              markerId: MarkerId(user.id.toString()),
              icon: networkImage,
              position:
              LatLng(user.address.geo.latitude, user.address.geo.long)));
        });
      }
      fitBounds();
    });
  }
}
