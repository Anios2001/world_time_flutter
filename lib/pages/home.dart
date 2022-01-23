import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map data={'location':'Default','time':'10:00AM','isDayTime':'true'};
String bgImage= 'daytime.png';
  @override
  Widget build(BuildContext context) {
    try {
      data = (data.isNotEmpty)? data :ModalRoute
          .of(context)!
          .settings
          .arguments as Map;
      bgImage= data['isDayTime'] ? 'daytime.png':'nightTime.jpeg';
    }
    catch(e){
      print(e);
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit:BoxFit.cover
              )
            ),
            child: Padding(padding:EdgeInsets.fromLTRB(12, 20, 12, 20),child:Column(
        children:<Widget>[FlatButton.icon(onPressed: () async{
            dynamic result= await Navigator.pushNamed(context, '/chooseLocation');
            setState(() {
              data = {
                'time' : result['time'],
                'location':result['location'],
                'flag' : result['flag'],
                'isDayTime': result['isDayTime']
              };
            });
        }, icon: Icon(Icons.edit_location,
                     color: Colors.grey[800]), label: Text("Edit Location")),
        SizedBox(height: 20,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(data['location'],style: TextStyle(fontSize: 28,letterSpacing: 2.0,color: Colors.white),),

        ],),SizedBox(height: 20.00,),
        Text(data['time'],style: TextStyle(fontSize: 66,fontWeight: FontWeight.bold,color: Colors.white),)])),
          ),
    ));
  }
}
