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
      setState(() {
        _fanValue = dataValue['fan'];
        _heaterValue = dataValue['heater'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back, color: Colors.blue,)),
        title: const Text('Storage', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700,color: Colors.blue, fontSize: 24),),
        centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Storage Time 🕛', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700,color: Colors.blue, fontSize: 24)),
            const Text('The Grain has been stored for :', style: TextStyle(fontFamily: 'Montserrat',color: Colors.black87, fontSize: 18)),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 18),
                      child: Column(
                        children: [
                          Text('23', style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Colors.blue, fontSize: 60),
                          ),
                          Text('Days', style: TextStyle(fontFamily: 'Montserrat',color: Colors.black87, fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 18),
                      child: Column(
                        children: [
                          Text('13', style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Colors.blue, fontSize: 60),
                          ),
                          Text('Hours', style: TextStyle(fontFamily: 'Montserrat',color: Colors.black87, fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}