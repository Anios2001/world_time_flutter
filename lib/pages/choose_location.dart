import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'est/now', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'utc/now', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'est/now', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'est/now', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'utc/now', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'utc/now', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'est/now', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'est/now', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(int index) async{
    WorldTime instance= locations.elementAt(index);
    await instance.getTime();

    Navigator.pop(context,{
      'time': instance.time , 'location' : instance.location , 'flag': instance.flag,'isDayTime': instance.isDaytime
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(title: Text('Choose Location '),centerTitle: true,),
      body:ListView.builder(itemCount: locations.length,itemBuilder: (context,index){
        return Padding(padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
         child:ListTile(
           onTap: (){
             updateTime(index);
           },
           title: Text(locations[index].location),
           leading: CircleAvatar(
             backgroundImage: AssetImage(locations[index].flag),
           )
         ));
      },),
    );

  }
}
