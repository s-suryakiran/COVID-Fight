import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    String totalDeaths;
    http.Response response =
        await http.get(url);
    String errorCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body.toString());
      //var recentDeathCount = decodedData['reports'][0];
      return decodedData;
    } else {
      print(response.statusCode.toString());
    }
  }
}
