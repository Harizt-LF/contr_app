import 'package:flutter/material.dart';
import 'package:contra_app/service/firebase_service.dart';
import 'package:firebase_database/firebase_database.dart';

class DryingPage extends StatefulWidget {
  const DryingPage({super.key});

  @override
  State<DryingPage> createState() => DryingPageState();
}

class DryingPageState extends State<DryingPage> {

  String? _humidityValue;
  String? _temperatureValue;
  FirebaseDatabase database = FirebaseDatabase.instance ;

  @override
  void initState() {
    super.initState();
    _dataListener();
  }


  void _dataListener(){
    DatabaseReference ref = FirebaseDatabase.instance.ref('/data');
    // DatabaseReference refHeater = FirebaseDatabase.instance.ref('/defuzzy/fan');

    ref.onValue.listen((DatabaseEvent event){
      final datasnapshot = event.snapshot.value;
      Map<dynamic, dynamic> dataValue = datasnapshot as Map<dynamic, dynamic>;
      if(mounted){
        setState(() {
        _humidityValue = dataValue['hum'];
        _temperatureValue = dataValue['temp'].toString();
      });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$_humidityValue & $_temperatureValue"),
      ),
    );
  }
}