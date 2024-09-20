import 'package:contra_app/service/firebase_service.dart';
import 'package:flutter/material.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  void initState(){
    super.initState();
    setMode('storage');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(
      child: Text('Storage Page'),
    ),);
  }
}