import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Landing()
    );
  }
}

class Landing extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        // if snapshot has error
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text('Error ${snapshot.error}'),
            ),
          );
        }
        
        // Connection Initialized  Firebase App is running
        if(snapshot.connectionState == ConnectionState.done){
          return Scaffold(
            body: Center(
              child: Text('Firebase App Initialized'),
            ),
          );
        }

        // Connecting to Firebase  - Loading
        return Scaffold(
          body: Center(
            child: Text('Initialization App.....'),
          ),
        );
      }
    );
  }
}

