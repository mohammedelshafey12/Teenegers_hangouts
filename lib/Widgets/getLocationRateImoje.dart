import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reviews_slider/reviews_slider.dart';
import 'package:googlemaps/Provider/AddFlagProvider.dart';
import 'package:googlemaps/constants.dart';


class getLocationRateImoje extends StatefulWidget {
  final double width;
  final double height;

  getLocationRateImoje({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  _getLocationRateImojeState createState() => _getLocationRateImojeState();
}

class _getLocationRateImojeState extends State<getLocationRateImoje> {
  int imojecurrentindex1 = 0;


  @override
  Widget build(BuildContext context) {
    final addflagprovider = Provider.of<Addflagprovider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: constants.whitecolor,
      ),
      width: widget.width * 0.9,
      height: widget.height * 0.65,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: constants.whitecolor,
            ),
            height: widget.height * 0.1,
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 1))),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Flexible(
                      child: Center(
                    child: Text(
                      "I feel exited in this place ",
                      style: TextStyle(fontFamily: 'font'),
                    ),
                  ))),
            ),
          ),
          Expanded(
              child: Container(
            child: Center(child: ReviewSlider(onChange: (index) {
              index==0?addflagprovider.imojeRate("verybad"):index==1?addflagprovider.imojeRate("bad"):index==2?addflagprovider.imojeRate("okay")
                  :index==3?addflagprovider.imojeRate("Good"):index==4?addflagprovider.imojeRate("Great"):"";
            })),
          )),
        ],
      ),
    );
  }
}
