import 'package:http/http.dart' as http;
import 'dart:convert';
void main(){
  getData();
}
void getData() async{
    http.Response response = await http.get("https://covid19api.io/api/v1/Deaths");
    String errorCode = response.statusCode.toString();
    if(response.statusCode ==200){
        var decodedData = jsonDecode(response.body.toString());
        var recentDeathCount = decodedData['deaths'][0];
        var  date= recentDeathCount['Date'];
        var  totalDeaths = recentDeathCount['TotalDeaths'];
        var  changeInTotal= recentDeathCount['ChangeInTotal'];
        var  changeTotalInPercent= recentDeathCount['ChangeTotalInPercent'];
        print("As of $date,"
            "totalDeaths: $totalDeaths"
            "changeInTotal: $changeInTotal"
            "changeTotalInPercent: $changeTotalInPercent");
    }else{
      print("Error code:$errorCode");
    }
}