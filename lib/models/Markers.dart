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
   int Value4;
   int Value5;
   int Value6;
   int Value7;
   int Value8;
   int Value9;
   int Value10;
   int Value11;
   int Value12;
   int Value13;



   String PlaceRate;
   var time;

   MarkerComments(this.owneruid, this.Question1, this.Question2,this.time,this.Question3,
       this.Question4, this.Question5, this.Question6, this.Question7,
       this.Question8, this.Question9, this.Question10, this.Question11,
       this.Question12, this.Question13, this.PlaceRate,this.Value4,this.Value5
       ,this.Value6,this.Value7,this.Value8,this.Value9,this.Value10,this.Value11,this.Value12,this.Value13
     );


 }
