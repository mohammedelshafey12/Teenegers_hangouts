import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlemaps/Provider/UserProvider.dart';
import 'package:googlemaps/Screens/waitingWidget.dart';
import 'package:googlemaps/Widgets/add_location_widget.dart';
import 'package:googlemaps/Widgets/getLocationRateImoje.dart';
import 'package:googlemaps/Widgets/getQuestions.dart';
import 'package:googlemaps/constants.dart';
import 'package:googlemaps/models/Markers.dart';
import 'package:googlemaps/servecies/store.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:googlemaps/Provider/AddFlagProvider.dart';

class addQuestions extends StatefulWidget {
  static String id = "addflag";
  @override
  _addQuestionsState createState() => _addQuestionsState();


}

class _addQuestionsState extends State<addQuestions> {
  int value = 0;

  static int currentindex = 0;
  void initState() {
    currentindex = 0;


  }

  PageController controller = PageController(initialPage: currentindex);
  var scrolldirection = Axis.horizontal;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Store  store = Store();
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value:FirebaseAuth.instance.onAuthStateChanged, )
      ],
      child: Material(
          child: Scaffold(
            appBar: AppBar(
              elevation: 1,
              centerTitle: true,
              backgroundColor: constants.whitecolor,
              title: Text(
                "Answer this",
                style: TextStyle(
                    fontFamily: 'font',
                    fontWeight: FontWeight.bold,
                    color: constants.blackcolor),
              ),
            ),
            body:

            ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.03),
                  child: Center(
                    child: Container(
                      height: height * 0.02,
                      width: width * 0.8,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: height * 0.025,
                            width: width * 0.8,
                            child: StepProgressIndicator(
                              totalSteps: 16,
                              currentStep: value,
                              size: 25,
                              padding: 0,
                              selectedColor: constants.primarycolor,
                              unselectedColor: constants.purblecolor,
                              roundedEdges: Radius.circular(10),
                            ),
                          ),
                          Positioned(
                            right: width * 0.05,
                            child: Text(
                              "+${value * 10} Point",
                              style: TextStyle(color: constants.orange),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Fill this",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'font'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.65,
                          child: PageView(
                            pageSnapping: true,
                            scrollDirection: scrolldirection,
                            physics: new NeverScrollableScrollPhysics(),
                            onPageChanged: (index) {
                              setState(() {
                                currentindex = index;
                              });
                            },
                            controller: controller,
                            children: <Widget>[
                              getQuestions(
                                width: width,
                                height: height,
                                question:  "•What do you do in this place?",
                                question1: "Socializing with friends",
                                question2: "playing sports ",
                                question3: "eating and drinking",
                                question4: "others ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number: 1,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: '•When do you go to those places? ',
                                question1: "Early  morning",
                                question2: "day of week",
                                question3: "seasonal",
                                question4: "others",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number: 2,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: '••	With Whom do you go with and meet their? ',
                                question1: "Friends",
                                question2: "family",
                                question3: "Alone ",
                                question4: "others",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number: 3,
                              ),
                              getLocationRateImoje(width: width, height: height,),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I like spend time with my friends in this place? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number: 4,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I can freely move around in this place ? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number: 5,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'There is no direct control on me from adult in this place? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number: 6,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I feel safe in this place ? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number:7,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I can express myself freely in this place ? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number:8,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I feel excited in this places ? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number:9,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I feel motivated in this place ? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number:10,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I Feel accepted  ? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number:11,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'There is a lot of recreational opportunities here? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number:12,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I can see and interact  with other teens easily? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number:13,
                              ),
                              getQuestions(
                                width: width,
                                height: height,
                                question: 'I have a lot of different activities  in this place? ',
                                question1: "Strongly disagree ",
                                question2: "Disagree ",
                                question3: "agree ",
                                question4: "Strongly agree ",
                                icon1: Icons.question_answer,
                                icon2: Icons.question_answer,
                                icon3: Icons.question_answer,
                                icon4: Icons.question_answer,
                                number:14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: width * 0.7,
                    height: height * 0.06,
                    child: Builder(
                      builder: (context)=>
                          FlatButton(
                            onPressed: () {
                              String adrees = Provider.of<Addflagprovider>(context,listen: false).adress1;
                              String imojeRate = Provider.of<Addflagprovider>(context,listen: false).imojeCurrentIndex;
                              String question1 = Provider.of<Addflagprovider>(context,listen: false).question1;
                              String question2 = Provider.of<Addflagprovider>(context,listen: false).question2;
                              String question3 = Provider.of<Addflagprovider>(context,listen: false).question3;
                              String question4 = Provider.of<Addflagprovider>(context,listen: false).question4;
                              String question5 = Provider.of<Addflagprovider>(context,listen: false).question5;
                              String question6 = Provider.of<Addflagprovider>(context,listen: false).question6;
                              String question7 = Provider.of<Addflagprovider>(context,listen: false).question7;
                              String question8 = Provider.of<Addflagprovider>(context,listen: false).question8;
                              String question9 = Provider.of<Addflagprovider>(context,listen: false).question9;
                              String question10= Provider.of<Addflagprovider>(context,listen: false).question10;
                              String question11 = Provider.of<Addflagprovider>(context,listen: false).question11;
                              String question12 = Provider.of<Addflagprovider>(context,listen: false).question12;
                              String question13 = Provider.of<Addflagprovider>(context,listen: false).question13;
                              String question14 = Provider.of<Addflagprovider>(context,listen: false).question14;
                              double lat = Provider.of<Addflagprovider>(context,listen: false).lat;
                              double long = Provider.of<Addflagprovider>(context,listen: false).lang;
                              var user = Provider.of<FirebaseUser>(context,listen: false);

                              if(currentindex==15){
                                var time  = DateTime.now();
                                if (ConnectionState.active != null){
                                  store.addNarker(Markers(adrees, GeoPoint(lat,long)), MarkerComments(user.uid, question1, question2, time,question3,question4,question5
                                    ,question6,question7,question8,question9,question10,question11,question12,question13,question14,imojeRate,));
                                  controller.dispose();
                                  setState(() {
                                    currentindex=-1;
                                  });
                                  Navigator.pushNamed(context, waitngWidget.id);

                                }
                              }

                                setState(() {
                                  currentindex++;
                                  if (value < 4) {
                                    value++;
                                  }

                                });
                                controller.animateToPage(currentindex,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.bounceInOut);

                            },
                            child: Center(
                              child: Text(
                                currentindex == 3 ? "Finish" : "Next",
                                style: TextStyle(fontFamily: 'font'),
                              ),
                            ),
                            color: constants.primarycolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }



}
