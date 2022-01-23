import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String time="time";
  String location;
  String flag;
  String url;
  bool isDaytime=true;
  WorldTime({required this.location,  required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var urlrequest = Uri.parse("http://worldclockapi.com/api/json/$url");
      Response response = await get(urlrequest);
      Map data = jsonDecode(response.body);

      String offset = data['utcOffset'].toString().substring(1, 3);

      DateTime now = DateTime.parse(data['currentDateTime']);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      isDaytime=(now.hour > 6 && now.hour < 20)?true:false;
    }
    catch(e){
      print('Error occured $e');
      time="Could not load data";
      location = "Default Location";
    }
   
    // var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    // String dateTime = data['utc_datetime'];
    // String offset= data['utc_offset'];
    //
    // print(dateTime);
    // print(offset);
  }
}