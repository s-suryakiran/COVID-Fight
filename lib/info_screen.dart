import 'constants.dart';
import 'package:flutter/material.dart';
import 'counter.dart';
import 'extract_data_from_web.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  var state;
  bool _isVisible = false;
  String countryInfected = "-";
  String countryDeaths = "-";
  String countryRecovered = "-";
  String Value;
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState

    getData();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  void getData() async {
    NetworkHelper nw = NetworkHelper('https://api.covid19india.org/data.json');

    var data = await nw.getData();
    //print(data);

    setState(() {
      state = data["statewise"];
      _isVisible = !_isVisible;
//      print(state);
    });
  }

  List<Widget> getStateInfo() {
    List<Widget> st = new List();
    if (state != null)
      for (var i in state) {
        if (i["state"] != "Total") {
          countryInfected = i["confirmed"].toString();
          countryDeaths = i["deaths"].toString();
          countryRecovered = i["recovered"].toString();
          st.add(SizedBox(height: 20));
          st.add(Container(
              alignment: Alignment.centerLeft,
              child: Text(
                i["state"].toString(),
                style: TextStyle(fontSize: 18),
              )));
          st.add(SizedBox(height: 10));

          st.add(
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Counter(
                      color: kInfectedColor,
                      number: countryInfected,
                      title: "Infected",
                    ),
                  ),
                  Expanded(
                    child: Counter(
                      color: kDeathColor,
                      number: countryDeaths,
                      title: "Deaths",
                    ),
                  ),
                  Expanded(
                    child: Counter(
                      color: kRecovercolor,
                      number: countryRecovered,
                      title: "Recovered",
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    return st;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InfoHeader(
              textTop: "",
              textBottom: "",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "State-wise",
                    style: kTitleTextstyle.copyWith(fontSize: 30),
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: Column(
                      children: getStateInfo(),
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const InfoHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _InfoHeaderState createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/india.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 20 - widget.offset / 2,
                    left: 220,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
