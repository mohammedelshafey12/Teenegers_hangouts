import 'dart:collection';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:googlemaps/Provider/UserProvider.dart';
import 'package:googlemaps/Screens/addflag.dart';
import 'package:googlemaps/Screens/explore.dart';
import 'package:googlemaps/Screens/favorite.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:googlemaps/Screens/profile.dart';
import 'package:googlemaps/Screens/addQuestions.dart';
import 'package:googlemaps/Widgets/Seaarch_weidget.dart';
import 'package:googlemaps/Widgets/home_user_pointes.dart';
import 'package:googlemaps/constants.dart';
import 'package:googlemaps/custom_icons/custom_icons.dart';
import 'package:googlemaps/models/Markers.dart';
import 'package:provider/provider.dart';
import 'package:googlemaps/servecies/store.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
  static String id = "home";
}

class _homeState extends State<home> {
  void _OnMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    setState(() {
      markers.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(37.43296265331126, -122.08832357078792),
        infoWindow: InfoWindow(
          title: "mohamed elshafey",
        ),
//     icon: markericon,
//       onTap: markertap(),
      ));
    });
  }

  int currentindex = 0;
  Position position;
  double lat, long;
  BitmapDescriptor markericon;

  static LatLng _initialPosition;

// to get places detail (lat/lng)
  //GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: constants.kGoogleApiKey);

  static LatLng _lastMapPosition =
      LatLng(30.04578362730974, 31.201951056718826);

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

  bool _checkConfiguration() => true;
  void initState() {
    // TODO: implement initState
    super.initState();
    setMarkerIcon();
//    if (_checkConfiguration()) {
//      Future.delayed(Duration.zero,() {
//
//    }
//    }
  }

  Set<Marker> markers = HashSet<Marker>();
  GoogleMapController googleMapController;

  String search;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String username = Provider.of<UserProvider>(context).UserName;
    int collectedpointes = Provider.of<UserProvider>(context).Scores;
    Store store = Store();
    List<MarkerComments> markercomments;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: constants.whitecolor,
          title: Text(
            currentindex == 0
                ? "Home"
                : currentindex == 1 ? "Favourite" : "Profile",
            style: TextStyle(
                fontFamily: 'font',
                fontWeight: FontWeight.bold,
                color: constants.blackcolor),
          ),
        ),
        body: StreamBuilder(
            stream: store.MarkersStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;

                  GeoPoint geoPoint = data[constants.Location];
                  double lat = geoPoint.latitude;
                  double long = geoPoint.longitude;
                  LatLng latLng = LatLng(lat, long);
                  markers.add(Marker(
                      infoWindow: InfoWindow(
                          title: data[constants.placeName],
                          snippet: "",
                          onTap: () {
                            showModalBottomSheet(
                                elevation: 1,
                                isScrollControlled: true,
                                context: context,
                                builder: (builder) {
                                  return StreamBuilder(
                                      stream: store.MarkersCommentStream(
                                          doc.documentID.toString()),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          markercomments = [];
                                          for (var doc2
                                              in snapshot.data.documents) {
                                            var data = doc2.data;
                                            markercomments.add(MarkerComments(
                                              data[constants.uid],
                                              data[constants.Question1],
                                              data[constants.Question2],
                                              data[constants.time],
                                              data[constants.Question3],
                                              data[constants.Question4],
                                              data[constants.Question5],
                                              data[constants.Question6],
                                              data[constants.Question7],
                                              data[constants.Question8],
                                              data[constants.Question9],
                                              data[constants.Question10],
                                              data[constants.Question11],
                                              data[constants.Question12],
                                              data[constants.Question13],
                                              data[constants.Question14],
                                              data[constants.placeRate],
                                            ));
                                          }
                                        }
                                        return StreamBuilder(
                                          stream: store.UserInfowithid(
                                              markercomments[0].owneruid),
                                          builder: (context, snapshot) =>
                                              Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.98,
                                                  color: Colors.white,
                                                  child: Scaffold(
                                                    appBar: AppBar(
                                                      elevation: 1,
                                                      centerTitle: true,
                                                      backgroundColor:
                                                          constants.whitecolor,
                                                      title: Text(
                                                        "Do You Love This Place?",
                                                        style: TextStyle(
                                                            fontFamily: 'font',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: constants
                                                                .blackcolor),
                                                      ),
                                                    ),
                                                    floatingActionButton:
                                                        FloatingActionButton
                                                            .extended(
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        addQuestions()));
                                                      },
                                                      label: Text(
                                                          "Add Your Answers now!"),
                                                      backgroundColor: constants
                                                          .primarycolor,
                                                    ),
                                                    floatingActionButtonLocation:
                                                        FloatingActionButtonLocation
                                                            .centerFloat,
                                                    body: Container(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                            color: constants
                                                                .primarycolor,
                                                            child: Center(
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        10),
                                                                child:
                                                                    AutoSizeText(
                                                                  data[constants
                                                                      .placeName],
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'font',
                                                                      color: constants
                                                                          .whitecolor),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  softWrap:
                                                                      true,
                                                                  wrapWords:
                                                                      true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.25,
                                                            width: width,
                                                            child: Image.asset(
                                                              "images/markercover.png",
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.15,
                                                            width: width,
                                                            child: GoogleMap(
                                                              mapType: MapType
                                                                  .normal,
                                                              markers: markers,
                                                              onMapCreated:
                                                                  _OnMapCreated,
                                                              initialCameraPosition:
                                                                  CameraPosition(
                                                                      bearing:
                                                                          180,
                                                                      target:
                                                                          latLng,
                                                                      zoom: 17),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              height:
                                                                  height * 0.2,
                                                              width: width,
                                                              child: ListView
                                                                  .builder(
                                                                      itemCount:
                                                                          markercomments
                                                                              .length,
                                                                      itemBuilder: (context,
                                                                              index) =>
                                                                          Container(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                              child: Container(
                                                                                height: height * 0.2,
                                                                                width: width * 0.9,
                                                                                color: Colors.white,
                                                                                child: Row(
                                                                                  children: <Widget>[
                                                                                    Container(
                                                                                      alignment: Alignment.topRight,
                                                                                      height: height * 0.2,
                                                                                      width: width * 0.17,
                                                                                      color: Colors.white,
                                                                                      child: SvgPicture.asset("images/profile.svg"),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(12.0),
                                                                                      child: Column(
                                                                                        children: <Widget>[
                                                                                          Row(
                                                                                            children: <Widget>[
                                                                                              Text(
                                                                                                snapshot.hasData == false ? "User Name" : "${snapshot.data.documents[0][constants.username]}",
                                                                                                style: TextStyle(fontFamily: 'font'),
                                                                                              ),
                                                                                              Text(
                                                                                                snapshot.hasData == false ? "User Name" : "   (${snapshot.data.documents[0][constants.score]} Point)",
                                                                                                style: TextStyle(fontFamily: 'font', fontWeight: FontWeight.bold),
                                                                                                softWrap: true,
                                                                                                maxLines: 1,
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: height * 0.01,
                                                                                          ),
                                                                                          AutoSizeText(
                                                                                            "Answers : ",
                                                                                            style: TextStyle(fontFamily: 'font'),
                                                                                            softWrap: true,
                                                                                            maxLines: 1,
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: height * 0.01,
                                                                                          ),
                                                                                          AutoSizeText(
                                                                                            "What do you do in this place ? ",
                                                                                            style: TextStyle(fontFamily: 'font', fontWeight: FontWeight.bold),
                                                                                            softWrap: true,
                                                                                            maxLines: 1,
                                                                                          ),
                                                                                          Text(snapshot.hasData == false ? "" : markercomments[index].Question1, style: TextStyle(fontFamily: 'font')),
                                                                                          SizedBox(
                                                                                            height: height * 0.01,
                                                                                          ),
                                                                                          AutoSizeText(
                                                                                            "When do you go to those places?",
                                                                                            style: TextStyle(fontFamily: 'font', fontWeight: FontWeight.bold),
                                                                                            softWrap: true,
                                                                                            maxLines: 1,
                                                                                          ),
                                                                                          Text(snapshot.hasData == false ? "" : markercomments[index].Question2, style: TextStyle(fontFamily: 'font'))
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                        );
                                      });
                                });
                          }),
                      markerId: MarkerId(data[constants.placeName]),
                      position: latLng));
                  print(data[constants.Location]);
                }
              }

              return Stack(
                children: <Widget>[
                  currentindex == 0
                      ? Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                home_user_pointes(
                                  width: width,
                                  height: height,
                                  username: username,
                                  colllectedpointes: collectedpointes,
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: GoogleMap(
                                      mapType: MapType.normal,
                                      markers: markers,
                                      onMapCreated: _OnMapCreated,
                                      initialCameraPosition: CameraPosition(
                                          target: _lastMapPosition, zoom: 20),
                                      myLocationButtonEnabled: true,
                                      myLocationEnabled: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.07,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: height * 0.11,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      Prediction p =
                                          await PlacesAutocomplete.show(
                                              context: context,
                                              apiKey: constants.kGoogleApiKey,
                                              mode: Mode.overlay,
                                              // Mode.fullscreen
                                              language: "Ar",
                                              onError: (e) {
                                                print(
                                                    "error:${e.errorMessage}");
                                              },
                                              components: [
                                            new Component(
                                                Component.country, "Eg")
                                          ]);
                                      _getLatLng(p);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 0.5)
                                          ]),
                                      height: height * 0.08,
                                      width: width * 0.8,
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(Icons.search),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Search",
                                            style: TextStyle(
                                                fontFamily: 'font',
                                                fontWeight: FontWeight.bold,
                                                color: constants.blackcolor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Builder(
                              builder: (context) => Positioned(
                                bottom: height * 0.09,
                                left: width * 0.03,
                                child: Row(
                                  children: <Widget>[
                                    Positioned(
                                      bottom: height * 0.1,
                                      left: width * 0.04,
                                      child: Opacity(
                                        opacity: 1,
                                        child: AvatarGlow(
                                          glowColor: Colors.black,
                                          endRadius: 49,
                                          child: FloatingActionButton(
                                            heroTag: 'btn1',
                                            backgroundColor:
                                                constants.primarycolor,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                child: Container(
                                                  child: AutoSizeText(
                                                    "  Add    place",
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, addflag.id);
                                            },
                                            elevation: 2,
                                            tooltip: "Add Place",
                                          ),
                                        ),
                                      ),
                                    ),
                                    AvatarGlow(
                                      endRadius: 90,
                                      child: FloatingActionButton.extended(
                                        heroTag: 'btn2',
                                        label: Text("Choose your fav Places"),
                                        backgroundColor: Colors.black26,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : currentindex == 1 ? favorite() : profile(),
                  Positioned(
                      right: 0.0,
                      bottom: 0.0,
                      left: 0.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          topLeft: Radius.circular(22),
                        ),
                        child: BottomNavigationBar(
                          currentIndex: currentindex,
                          onTap: (index) {
                            setState(() {
                              currentindex = index;
                            });
                          },
                          backgroundColor: constants.whitecolor,
                          elevation: 5,
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Custom_icons.explore,
                                ),
                                title: Text(
                                  "Explore",
                                  style: TextStyle(fontFamily: 'font'),
                                )),
                            BottomNavigationBarItem(
                                icon: Icon(Custom_icons.heart),
                                title: Text(
                                  "Favorites",
                                  style: TextStyle(fontFamily: 'font'),
                                )),
                            BottomNavigationBarItem(
                                icon: Icon(Custom_icons.profile),
                                title: Text(
                                  "Account",
                                  style: TextStyle(fontFamily: 'font'),
                                )),
                          ],
                          unselectedItemColor: Colors.grey,
                          selectedItemColor: constants.primarycolor,
                          showUnselectedLabels: true,
                        ),
                      ))
                ],
              );
            }),
      ),
    );
  }

//  void _currentLocation() async {
//    final GoogleMapController controller = await controller.future;
//    LocationData currentLocation;
//    var location = new Location();
//    try {
//      currentLocation = await location.getLocation();
//    } on Exception {
//      currentLocation = null;
//    }
//
//    controller.animateCamera(CameraUpdate.newCameraPosition(
//      CameraPosition(
//        bearing: 0,
//        target: LatLng(currentLocation.latitude, currentLocation.longitude),
//        zoom: 17.0,
//      ),
//    ));
//  }
  void _getLatLng(Prediction prediction) async {
    GoogleMapsPlaces _places = new GoogleMapsPlaces(
        apiKey: constants.kGoogleApiKey); //Same API_KEY as above
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(prediction.placeId);
    double latitude = detail.result.geometry.location.lat;
    double longitude = detail.result.geometry.location.lng;
    String address = prediction.description;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(latitude, longitude), zoom: 10, bearing: 90)));
    print(address);
  }
}
