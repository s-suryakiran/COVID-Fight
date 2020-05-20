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
      var recentDeathCount = decodedData['deaths'][0];
      return recentDeathCount['TotalDeaths'].toString();
    } else {
      print(response.statusCode.toString());
    }
  }
}

//        var  date= recentDeathCount['Date'];
//        var  changeInTotal= recentDeathCount['ChangeInTotal'];
//        var  changeTotalInPercent= recentDeathCount['ChangeTotalInPercent'];
