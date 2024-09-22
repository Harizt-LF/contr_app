import 'package:contra_app/service/firebase_service.dart';
import 'package:contra_app/views/storage_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 4),
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  )
                ),
                onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StoragePage()));}, 
                child: 
                const Text("Storage Mode", style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700,color: Colors.white, fontSize: 18),)
              ),
              const SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 4),
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  )
                ),
                onPressed: () {setMode('drying');}, 
                child: const Text("Drying Mode", style: TextStyle(fontFamily: 'Montserrat',  color: Colors.white, fontSize: 18),)
              )
          ])
        ),
      ),
    );
  }
}