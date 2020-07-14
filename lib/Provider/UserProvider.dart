
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  String UserName;
  int Scores;
  int Age;
  String accesstoken;

  getaccesstoken(String acess){
    accesstoken = acess;
    notifyListeners();
  }
  getUserInformation(String name,int scores,int age){
    UserName = name;
    Scores = scores;
    Age = age;
    notifyListeners();
  }




}