import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pokemon2/data/post_data.dart';
import 'package:pokemon2/data/user_data.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key}) : super(key: key);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> markers = <Marker>{};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as UserDetailsArg;
    final user = arg.user;
    final post = arg.listPost;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name : ${user.name}'),
              Text('Email : ${user.email}'),
              Text('Phone : ${user.phone}'),
              const SizedBox(height: 20),
              SizedBox(
                height: size.width,
                child: GoogleMap(
                  mapType: MapType.terrain,
                  markers: markers,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              const SizedBox(height: 20),
              ...post.map((e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text(e.body),
                      const Divider()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _goToLocation(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;
    final position =
        CameraPosition(target: LatLng(lat, lng), zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final arg = ModalRoute.of(context)?.settings.arguments as UserDetailsArg;
      final user = arg.user;
      setState(() {
        markers.add(Marker(
            markerId: MarkerId(user.id.toString()),
            position:
                LatLng(user.address.geo.latitude, user.address.geo.long)));
      });
      _goToLocation(user.address.geo.latitude, user.address.geo.long);
    });
  }
}

class UserDetailsArg {
  final UserData user;
  final List<PostData> listPost;

  UserDetailsArg(this.user, this.listPost);
}
