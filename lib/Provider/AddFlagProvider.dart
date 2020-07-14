
import 'package:flutter/cupertino.dart';

class Addflagprovider extends ChangeNotifier{
  String imojeCurrentIndex;
  String adress1 ;
  String question1;
  String question2;
  String question3;
  String question4;
  String question5;
  String question6;
  String question7;
  String question8;
  String question9;
  String question10;
  String question11;
  String question12;
  String question13;
  String question14;
  double lat;
  double lang;

  getlatlang(double latt,double long){
    lat = latt ;
    lang = long;
    notifyListeners();
  }
  question1Result(String quest){
    question1 = quest;
    notifyListeners();
  }
  question3Result(String quest){
    question3 = quest;
    notifyListeners();
  }
  question10Result(String quest){
    question10 = quest;
    notifyListeners();
  }
  question11Result(String quest){
    question11 = quest;
    notifyListeners();
  }
  question12Result(String quest){
    question12 = quest;
    notifyListeners();
  }
  question13Result(String quest){
    question13 = quest;
    notifyListeners();
  }
  question14Result(String quest){
    question14 = quest;
    notifyListeners();
  }
  question4Result(String quest){
    question4 = quest;
    notifyListeners();
  }
  question5Result(String quest){
    question5 = quest;
    notifyListeners();
  }
  question6Result(String quest){
    question6 = quest;
    notifyListeners();
  }
  question7Result(String quest){
    question7 = quest;
    notifyListeners();
  }
  question8Result(String quest){
    question8 = quest;
    notifyListeners();
  }
  question9Result(String quest){
    question9 = quest;
    notifyListeners();
  }
  question2Result(String questio){
    question2 = questio;
    notifyListeners();
  }
  imojeRate(String imojeindex){
    imojeCurrentIndex = imojeindex;

    notifyListeners();
  }
  getaddress(String adress){
    adress1=adress;
    notifyListeners();
  }
}