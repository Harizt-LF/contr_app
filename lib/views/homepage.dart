import 'package:contra_app/service/firebase_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                onPressed: () {setMode('storage');}, 
                child: const Text("Storage Mode", style: TextStyle(color: Colors.white, fontSize: 18),)
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
                child: const Text("Drying Mode", style: TextStyle(color: Colors.white, fontSize: 18),)
              )
          ])
        ),
      ),
    );
  }
}