import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googlemaps/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemaps/Widgets/Seaarch_weidget.dart';
import 'package:googlemaps/Widgets/home_user_pointes.dart';
import 'package:provider/provider.dart';
import 'package:googlemaps/Provider/UserProvider.dart';
class explore extends StatefulWidget {
  @override
  _exploreState createState() => _exploreState();
}

class _exploreState extends State<explore> {
  Position position;
  double lat, long;
  BitmapDescriptor markericon;
  FirebaseUser user;
  static LatLng _initialPosition;

  static LatLng _lastMapPosition =
      LatLng(37.43296265331126, -122.08832357078792);

  void setMarkerIcon() async {
    markericon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          size: Size(1, 1),
        ),
        "images/image2.png");
  }

  getposition() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });
  }

  markertap() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                           ""),
                      trailing: Checkbox(value: false, onChanged: null),
                    ),
                    ListTile(
                      title: Text("هل تحب هذا المكان ؟"),
                      trailing: Checkbox(value: false, onChanged: null),
                    ),
                    ListTile(
                      title: Text("هل تحب هذا المكان ؟"),
                      trailing: Checkbox(value: false, onChanged: null),
                    ),
                    ListTile(
                      title: Text("هل تحب هذا المكان ؟"),
                      trailing: Checkbox(value: false, onChanged: null),
                    ),
                    ListTile(
                      title: Text("هل تحب هذا المكان ؟"),
                      trailing: Checkbox(value: false, onChanged: null),
                    ),
                  ],
                )),
          );
        });
  }
  bool _checkConfiguration() => true;
  void initState() {
    // TODO: implement initState
    super.initState();
    setMarkerIcon();
    _getUserLocation();
    setState(() {
      _initialPosition = _lastMapPosition;
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("any")));
      String username = Provider.of<UserProvider>(context).UserName;
      print(username);

      print("this is intitfhbjnkm");
    });

  }

  void _getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
    });
  }

  Set<Marker> markers = HashSet<Marker>();
  GoogleMapController googleMapController;

  void _OnMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    setState(() {
      markers.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(37.43296265331126, -122.08832357078792),
        infoWindow: InfoWindow(title: "mohamed elshafey", onTap: markertap),
//     icon: markericon,
//       onTap: markertap(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String username = Provider.of<UserProvider>(context).UserName;
    double opacity = 1;
    return Stack(
    children: <Widget>[
        Column(
          children: <Widget>[
            home_user_pointes(width: width, height: height,username: username,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
              //  height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: markers,
                  onMapCreated: _OnMapCreated,
                  initialCameraPosition:
                      CameraPosition(target: _lastMapPosition, zoom: 20),
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                ),
              ),
            ),
          ],
        ),
        Search_Wideget(height: height, width: width),
        Positioned(
          bottom: height * 0.08,
          right: width * 0.05,
          child: Opacity(
            opacity: opacity,
            child: FloatingActionButton(
              backgroundColor: constants.primarycolor,
              child: Icon(Icons.flag),
              onPressed: () {},
              elevation: 2,
              tooltip: "Add Place",
            ),
          ),
        ),
      ],
    );
  }
}
