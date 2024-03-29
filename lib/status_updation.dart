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
var data;
  final controller = ScrollController();
  double offset = 0;
  String deaths;
  String cases;
  String recovered;
  var table;
  String countryInfected = '-';
  String countryDeaths = '-';
  String countryRecovered = '-';
  String Value;
  List<String> countryNames = new List();

  void getData() async {
    NetworkHelper nw = NetworkHelper('https://coronavirus-19-api.herokuapp.com/countries');

    data = await nw.getData();
print(data);
    setState(() {
      cases = data[0]['cases'].toString();
      deaths = data[0]['deaths'].toString();
      recovered = data[0]["recovered"].toString();
//      table = data['reports'][0]['table'][0];
      for (var i in data) {
        if (i["country"] != 'World')
          countryNames.add(i['country']);
      }

      countryNames.sort();
    });
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
              textTop: "All you need is",
              textBottom: "stay at home.",
              offset: offset,
            ),
            SizedBox(height: 10),
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
                              style: kTitleTextstyle.copyWith(fontSize: 20),
                            ),
                            TextSpan(
                              text: "WorldWide",
                              style: TextStyle(
                                  color: kTextLightColor, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
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
                          child: Counter(
                            color: kInfectedColor,
                            number: cases != null ? cases : 'loading..',
                            title: "Infected",
                          ),
                        ),
                        Expanded(
                          child: Counter(
                            color: kDeathColor,
                            number: deaths != null ? deaths : 'loading..',
                            title: "Deaths",
                          ),
                        ),
                        Expanded(
                          child: Counter(
                            color: kRecovercolor,
                            number: recovered != null ? recovered : 'loading..',
                            title: "Recovered",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Country-wise",
                      style: TextStyle(color: kTextLightColor, fontSize: 17),
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
                            hint: new Text("Select Country"),
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
                              for (var i in data) {
                                if (value == i['country']) {
                                  setState(() {
                                    Value = value;
                                    if (i['cases'].toString() != "")
                                      countryInfected =
                                          i['cases'].toString();
                                    if (i['deaths'].toString() != "")
                                      countryDeaths =
                                          i['deaths'].toString();
                                    if (i['recovered'].toString() != "")
                                      countryRecovered =
                                          i['recovered'].toString();
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
                  SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
