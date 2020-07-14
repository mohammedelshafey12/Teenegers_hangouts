import 'package:cloud_firestore/cloud_firestore.dart';

class Markers {
  String placename;
  GeoPoint markerlocation;


  Markers(this.placename, this.markerlocation, );


}
 class MarkerComments{
   String owneruid;
   String Question1;
   String Question2;
   String Question3;
   String Question4;
   String Question5;
   String Question6;
   String Question7;
   String Question8;
   String Question9;
   String Question10;
   String Question11;
   String Question12;
   String Question13;
   String Question14;


   String PlaceRate;
   var time;

   MarkerComments(this.owneruid, this.Question1, this.Question2,this.time,this.Question3,
       this.Question4, this.Question5, this.Question6, this.Question7,
       this.Question8, this.Question9, this.Question10, this.Question11,
       this.Question12, this.Question13, this.Question14, this.PlaceRate,
     );


 }
