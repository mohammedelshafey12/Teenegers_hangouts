import 'package:flutter/material.dart';
import 'package:googlemaps/Provider/AddFlagProvider.dart';
import 'package:googlemaps/constants.dart';
import 'package:provider/provider.dart';
class getQuestions extends StatefulWidget {
  const getQuestions({
    Key key,
    @required this.width,
    @required this.height, this.question1, this.question2, this.question3, this.question4, this.icon1, this.icon2, this.icon3, this.icon4, this.number, this.question,
  }) : super(key: key);
  final int number;
  final double width;
  final double height;
  final String question1;
  final String question;
  final String question2;
  final String question3;
  final String question4;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final IconData icon4;

  @override
  _getQuestionsState createState() => _getQuestionsState();
}

class _getQuestionsState extends State<getQuestions> {
  bool ischeck1 = false;
  bool ischeck2 = false;
  bool ischeck3 = false;
  bool ischeck4 = false;
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
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              color: constants.whitecolor,
            ),
            height: widget.height * 0.1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey,
                          width: 1))),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10),
                  child: Flexible(
                      child: Center(
                        child: Text(
                         widget.question,
                          style:
                          TextStyle(fontFamily: 'font'),
                        ),
                      ))),
            ),
          ),
          Expanded(child: Container(
            child: Column(
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Icon(widget.icon4,color: constants.primarycolor,),
                        title: Text(
                       widget.question1,
                          style:
                          TextStyle(fontFamily: 'font'),
                        ),
                        trailing: Checkbox(value: ischeck1, onChanged: (bool b){
                          setState(() {
                            ischeck1 = b;
                            if(b==true&&widget.number==1){
                              addflagprovider.question1Result(widget.question1);
                            }else if (b==true&&widget.number==2){
                              addflagprovider.question2Result(widget.question1);
                            }else if (b==true&&widget.number==3){
                              addflagprovider.question3Result(widget.question1);
                            }
                            else if (b==true&&widget.number==4){
                              addflagprovider.question4Result(widget.question1);
                            }else if (b==true&&widget.number==4){
                              addflagprovider.question4Result(widget.question1);
                            }
                            else if (b==true&&widget.number==5){
                              addflagprovider.question5Result(widget.question1);
                            }else if (b==true&&widget.number==6){
                              addflagprovider.question6Result(widget.question1);
                            }else if (b==true&&widget.number==7){
                              addflagprovider.question7Result(widget.question1);
                            }else if (b==true&&widget.number==8){
                              addflagprovider.question8Result(widget.question1);
                            }else if (b==true&&widget.number==9){
                              addflagprovider.question9Result(widget.question1);
                            }else if (b==true&&widget.number==10){
                              addflagprovider.question10Result(widget.question1);
                            }else if (b==true&&widget.number==11){
                              addflagprovider.question11Result(widget.question1);
                            }else if (b==true&&widget.number==12){
                              addflagprovider.question12Result(widget.question1);
                            }else if (b==true&&widget.number==13){
                              addflagprovider.question13Result(widget.question1);
                            }else if (b==true&&widget.number==14){
                              addflagprovider.question14Result(widget.question1);
                            }
                          });
                        }),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Icon(widget.icon2,color: constants.primarycolor,),
                        title: Text(
                         widget.question2,
                          style:
                          TextStyle(fontFamily: 'font'),
                        ),
                        trailing: Checkbox(value: ischeck2, onChanged: (b){
                          setState(() {
                            ischeck2 = b;
                            if(b==true&&widget.number==1){
                              addflagprovider.question1Result(widget.question2);
                            }else if (b==true&&widget.number==2){
                              addflagprovider.question2Result(widget.question2);
                            }else if (b==true&&widget.number==3){
                              addflagprovider.question3Result(widget.question2);
                            }
                            else if (b==true&&widget.number==4){
                              addflagprovider.question4Result(widget.question2);
                            }else if (b==true&&widget.number==4){
                              addflagprovider.question4Result(widget.question2);
                            }
                            else if (b==true&&widget.number==5){
                              addflagprovider.question5Result(widget.question2);
                            }else if (b==true&&widget.number==6){
                              addflagprovider.question6Result(widget.question2);
                            }else if (b==true&&widget.number==7){
                              addflagprovider.question7Result(widget.question2);
                            }else if (b==true&&widget.number==8){
                              addflagprovider.question8Result(widget.question2);
                            }else if (b==true&&widget.number==9){
                              addflagprovider.question9Result(widget.question2);
                            }
                            else if (b==true&&widget.number==10){
                              addflagprovider.question10Result(widget.question2);
                            }else if (b==true&&widget.number==11){
                              addflagprovider.question11Result(widget.question2);
                            }else if (b==true&&widget.number==12){
                              addflagprovider.question12Result(widget.question2);
                            }else if (b==true&&widget.number==13){
                              addflagprovider.question13Result(widget.question2);
                            }else if (b==true&&widget.number==14){
                              addflagprovider.question14Result(widget.question2);
                            }
                          });
                        }),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Icon(widget.icon3,color: constants.primarycolor,),
                        title: Text(
                          widget.question3,
                          style:
                          TextStyle(fontFamily: 'font'),
                        ),
                        trailing: Checkbox(value: ischeck3, onChanged: (b){
                          setState(() {
                            ischeck3 = b;
                           if(b==true&&widget.number==1){
                              addflagprovider.question1Result(widget.question3);
                            }else if (ischeck3==true&&widget.number==2){
                              addflagprovider.question2Result(widget.question3);
                            }else if (b==true&&widget.number==3){
                             addflagprovider.question3Result(widget.question3);
                           }
                           else if (b==true&&widget.number==4){
                             addflagprovider.question4Result(widget.question3);
                           }else if (b==true&&widget.number==4){
                             addflagprovider.question4Result(widget.question3);
                           }
                           else if (b==true&&widget.number==5){
                             addflagprovider.question5Result(widget.question3);
                           }else if (b==true&&widget.number==6){
                             addflagprovider.question6Result(widget.question3);
                           }else if (b==true&&widget.number==7){
                             addflagprovider.question7Result(widget.question3);
                           }else if (b==true&&widget.number==8){
                             addflagprovider.question8Result(widget.question3);
                           }else if (b==true&&widget.number==9){
                             addflagprovider.question9Result(widget.question3);
                           } else if (b==true&&widget.number==10){
                             addflagprovider.question10Result(widget.question3);
                           }else if (b==true&&widget.number==11){
                             addflagprovider.question11Result(widget.question3);
                           }else if (b==true&&widget.number==12){
                             addflagprovider.question12Result(widget.question3);
                           }else if (b==true&&widget.number==13){
                             addflagprovider.question13Result(widget.question3);
                           }else if (b==true&&widget.number==14){
                             addflagprovider.question14Result(widget.question3);
                           }
                          });
                        }),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(

                    child: Center(
                      child: ListTile(
                        leading: Icon(widget.icon4,color: constants.primarycolor,),
                        title: Text(
                         widget.question4,
                          style:
                          TextStyle(fontFamily: 'font'),
                        ),
                        trailing: Checkbox(value: ischeck4, onChanged: (b){
                          setState(() {
                            ischeck4 = b;
                            if(ischeck4==true&&widget.number==1){
                              addflagprovider.question1Result(widget.question4);
                            }else if (b==true&&widget.number==2){
                              addflagprovider.question2Result(widget.question4);
                            }else if (b==true&&widget.number==3){
                              addflagprovider.question3Result(widget.question4);
                            }
                            else if (b==true&&widget.number==4){
                              addflagprovider.question4Result(widget.question4);
                            }else if (b==true&&widget.number==4){
                              addflagprovider.question4Result(widget.question4);
                            }
                            else if (b==true&&widget.number==5){
                              addflagprovider.question5Result(widget.question4);
                            }else if (b==true&&widget.number==6){
                              addflagprovider.question6Result(widget.question4);
                            }else if (b==true&&widget.number==7){
                              addflagprovider.question7Result(widget.question4);
                            }else if (b==true&&widget.number==8){
                              addflagprovider.question8Result(widget.question4);
                            }else if (b==true&&widget.number==9){
                              addflagprovider.question9Result(widget.question4);
                            } else if (b==true&&widget.number==10){
                              addflagprovider.question10Result(widget.question4);
                            }else if (b==true&&widget.number==11){
                              addflagprovider.question11Result(widget.question4);
                            }else if (b==true&&widget.number==12){
                              addflagprovider.question12Result(widget.question4);
                            }else if (b==true&&widget.number==13){
                              addflagprovider.question13Result(widget.question4);
                            }else if (b==true&&widget.number==14){
                              addflagprovider.question14Result(widget.question4);
                            }
                          });
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
