import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class favorite extends StatelessWidget {
  static LatLng _lastMapPosition =
      LatLng(37.43296265331126, -122.08832357078792);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(

          child:Center(
            child: Text("No Fav Yet.....",style: TextStyle(fontFamily: 'font'),),
          ),
        ),
      ),
    );
  }
}
