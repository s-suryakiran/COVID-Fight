import 'constants.dart';
import 'counter.dart';
import 'header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'extract_data_from_web.dart';

class StatusUpdation extends StatefulWidget {
  @override
  _StatusUpdationState createState() => _StatusUpdationState();
}

class _StatusUpdationState extends State<StatusUpdation> {
  final controller = ScrollController();
  double offset = 0;
  String deaths;
  String cases;
  String recovered;
  var table;
  String countryInfected = '-';
  String countryDeaths = '-';
  String countryRecovered = '-';
  String Value = "Indonesia";
  List<String> countryNames = new List();

  void getData() async {
    NetworkHelper nw = NetworkHelper('https://covid19api.io/api/v1/AllReports');

    var data = await nw.getData();

    setState(() {
      cases = data['cases'].toString();
      deaths = data['deaths'].toString();
      recovered = data['recovered'].toString();
      table = data['table'][0];
      for (var i in table) {
        countryNames.add(i['Country']);
      }

      countryNames.sort();});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
    getData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
//              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: offset,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Newest update "+(DateTime.now().month).toString(),
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
                          child: Column(
                            children: <Widget>[
                              Text(cases != null ? cases : 'loading..'),
                              Text(
                                "Infected",
                                style: TextStyle(
                                    color: kInfectedColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(deaths != null ? deaths : 'loading..'),
                              Text(
                                "Deaths",
                                style: TextStyle(
                                    color: kDeathColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(recovered != null ? recovered : 'loading..'),
                              Text(
                                "Recovered",
                                style: TextStyle(
                                    color: kRecovercolor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                        SizedBox(width: 20),
                        Expanded(
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox(),
                            icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                            value: Value,
                            items: countryNames
                                .map<DropdownMenuItem<String>>((String Value) {
                              return DropdownMenuItem<String>(
                                value: Value,
                                child: Text(Value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              for (var i in table) {
                                if (value == i['Country']) {
                                  setState(() {
                                    Value = value;
                                    countryInfected=i['TotalCases'].toString();
                                    countryDeaths=i['TotalDeaths'].toString();
                                    countryRecovered=i['TotalRecovered'].toString();

                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
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
                          child: Column(
                            children: <Widget>[
                              Text(countryInfected),
                              Text(
                                "Infected",
                                style: TextStyle(
                                    color: kInfectedColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(countryDeaths),
                              Text(
                                "Deaths",
                                style: TextStyle(
                                    color: kDeathColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(countryRecovered),
                              Text(
                                "Recovered",
                                style: TextStyle(
                                    color: kRecovercolor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
