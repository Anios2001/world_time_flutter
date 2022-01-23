

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {

  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.blue,
      body:Center(
        child:SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    ),
    ),
    );
  }
  void setUpWorldTime() async{
    WorldTime timel = WorldTime(location: "Berlin", flag: "berlin.png", url: 'est/now');
    await timel.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'time': timel.time , 'location' : timel.location , 'flag': timel.flag,'isDayTime':timel.isDaytime
    });
  }
  @override
  void initState() {
      super.initState();
      setUpWorldTime();
  }
}
