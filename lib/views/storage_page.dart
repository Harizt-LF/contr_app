import 'package:contra_app/service/firebase_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  
  String? _fanValue;
  String? _heaterValue;
  FirebaseDatabase database = FirebaseDatabase.instance ;

  @override
  void initState(){
    super.initState();
    setMode('storage');
    _dataListener();
    
  }

  void _dataListener(){
    DatabaseReference refFan = FirebaseDatabase.instance.ref('/defuzzy');
    // DatabaseReference refHeater = FirebaseDatabase.instance.ref('/defuzzy/fan');

    refFan.onValue.listen((DatabaseEvent event){
      final datasnapshot = event.snapshot.value;
      Map<dynamic, dynamic> dataValue = datasnapshot as Map<dynamic, dynamic>;
      print(dataValue);
      setState(() {
        _fanValue = dataValue['fan'];
        _heaterValue = dataValue['heater'];
      });
      print(datasnapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Fan : $_fanValue"),
        ),
    ),);
  }
}