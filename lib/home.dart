import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'selfDiagnosis/self_diagnosis_home.dart';
import 'selfDiagnosis/self_diagnosis_brain.dart';
import 'package:firebase_admob/firebase_admob.dart';
//import 'package:admob_flutter/admob_flutter.dart';
import 'admob_service.dart';
const String testDevice='';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ams =AdMobService();
  static final MobileAdTargetingInfo targetInfo=new MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>['Covid'],


  );
  BannerAd _bannerAd;
  BannerAd createBannerAd(){
    return new BannerAd(adUnitId: "ca-app-pub-1822795815054835/1121188679", size: AdSize.banner,targetingInfo: targetInfo,listener: (MobileAdEvent e){
      print("banner:$e");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Admob.initialize("ca-app-pub-1822795815054835~2434270349");
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-1822795815054835~2434270349") ;
    _bannerAd = createBannerAd()..load()..show();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  //_bannerAd?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurple,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.deepPurple[800],
                      ),
                      padding: EdgeInsets.all(15),
                      child: Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Center(
                          child: Text(
                            "Covid-19",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Monoton",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.topLeft,
                      child: Text("Are you feeling sick?",
                          style: kTitleTextstyle.copyWith(
                              color: Color(0xfff3e6ff),
                              fontSize: 18,
                              letterSpacing: 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              color: Colors.red,
                              onPressed: () async {
                                const url = "tel:+911123978046";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.phoneAlt,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Dial\nEmergency",
                                        textAlign: TextAlign.center,
                                        style: kTitleTextstyle.copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                StoryBrain brain = StoryBrain();
                                int type = brain.getQuestionType(3);
                                print(brain.getOptions(3));
                                if (type == 3) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelfDiagnosisHome()));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.stethoscope,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Self\nDiagnosis",
                                        textAlign: TextAlign.center,
                                        style: kTitleTextstyle.copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    "Prevention",
                    style: kTextStyle,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/wash.png",
                          ),
                          Text("Wash hands"),
                          Text("frequently")
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/mask.jpg",
                          ),
                          Text("Wear"),
                          Text("Masks")
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/socialdistance.jpeg",
                          ),
                          Text("Social"),
                          Text("Distancing")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    "Symptoms",
                    style: kTextStyle,
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/caugh.png",
                          ),
                          Text("Cough"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/fever.png",
                          ),
                          Text("Fever"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/headache.png",
                          ),
                          Text("Headache"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
//            AdmobBanner(
//              adUnitId: "ca-app-pub-1822795815054835/1121188679",
//              adSize: AdmobBannerSize.BANNER,
//            ),
            ],
          ),
        ));
  }
}
