import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:googlemaps/constants.dart';
import 'package:googlemaps/models/Markers.dart';
import 'package:googlemaps/models/user.dart';
import 'package:provider/provider.dart';

class Store {
  Firestore firestore = Firestore.instance;
  adduser(User user) {
    firestore.collection(constants.usercollection).document().setData({
      constants.username: user.username,
      constants.age: user.age,
      constants.uid: user.uid,
      constants.score: user.score
    });
  }
  addNarker(Markers markers,MarkerComments markerComments) {
    var time = DateTime.now();
    firestore.collection(constants.Markerscollection).document(time.toIso8601String()).setData({
      constants.placeName: markers.placename,

      constants.Location:markers.markerlocation,


    });
    firestore.collection(constants.Markerscollection).document(time.toIso8601String()).collection(constants.MarkersCommentscollection).document().setData({
      constants.uid: markerComments.owneruid,
      constants.Question1:markerComments.Question1,
      constants.Question2:markerComments.Question2,
      constants.placeRate:markerComments.PlaceRate,
      constants.time:markerComments.time,
      constants.Question3:markerComments.Question3,
      constants.Question4:markerComments.Question4,
      constants.Question5:markerComments.Question5,
      constants.Question6:markerComments.Question6,
      constants.Question7:markerComments.Question7,
      constants.Question8:markerComments.Question8,
      constants.Question9:markerComments.Question9,
      constants.Question10:markerComments.Question10,
      constants.Question11:markerComments.Question11,
      constants.Question12:markerComments.Question12,
      constants.Question13:markerComments.Question13,
      constants.Question14:markerComments.Question14,

    });
  }


  adduserfacebook(User user, String uid) {
    firestore.collection(constants.usercollection).document(uid).setData({
      constants.username: user.username,
      constants.age: user.age,
      constants.uid: user.uid,
      constants.score: user.score
    });
  }
  Stream<QuerySnapshot> MarkersCommentStream(String documentId) {

    return firestore
        .collection(constants.Markerscollection).document(documentId).collection(constants.MarkersCommentscollection).orderBy(constants.time)
        .snapshots();
  }
  Stream<QuerySnapshot> MarkersStream() {

    return firestore
        .collection(constants.Markerscollection)
        .snapshots();
  }
  Stream<QuerySnapshot> UserInfo(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return firestore
        .collection(constants.usercollection)
        .where(constants.uid, isEqualTo: user.uid)
        .snapshots();
  }
  Stream<QuerySnapshot> UserInfowithid(String  id) {
    return firestore
        .collection(constants.usercollection)
        .where(constants.uid, isEqualTo: id)
        .snapshots();
  }
//  addMarker(Markers markers) {
//    firestore.collection(constants.usercollection).document().collection("collectionPath").document().setData({
//      constants.username: user.username,
//      constants.age: user.age,
//      constants.uid: user.uid,
//      constants.score: user.score
//    });
  // }
}
