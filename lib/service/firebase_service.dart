import 'package:contra_app/main.dart';
import 'package:contra_app/views/homepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


FirebaseDatabase database = FirebaseDatabase.instance ;

Future<Widget> getHomepage() async {
  DatabaseReference ref = database.ref('/serviceState');
  final page = await ref.get();
  if(page.exists){ if (page.value.toString() == 'storage'){
    return const HomePage();
  } else if( page.value.toString() == 'drying'){
    return const MyHomePage(title: 'Drying Mode');
  } else {
    return const MyHomePage(title: 'Menu');
  }
  } else {
    return const MyHomePage(title: 'Error');
  }
}



