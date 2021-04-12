import 'package:ecommece/constants.dart';
import 'package:ecommece/screen/home.page.dart';
import 'package:ecommece/screen/login.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // if snapshot has error
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error ${snapshot.error}'),
              ),
            );
          }

          // Connection Initialized  Firebase App is running
          if (snapshot.connectionState == ConnectionState.done) {
            // StreamBuilder can check the login state live
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamSnapshot) {
                  // If Stream Snapshot has Error
                  if (streamSnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text('Error ${streamSnapshot.error}'),
                      ),
                    );
                  }

                  // Connection state active  Do the user login check inside the state
                  // if statement
                  if(streamSnapshot.connectionState == ConnectionState.active){

                    // Get the user
                    User _user = streamSnapshot.data;
                    // If the user is null, we're not login
                    if(_user == null){
                      // user not logged in, head to login
                      return LoginPage();
                    }else {
                      // The user is logged in, head to homepage
                      return HomePage();
                    }
                  }
                  // Cheaking the auth state  - Loading
                  return Scaffold(
                    body: Center(
                      child: Text(
                        'Cheaking Authentication.....',
                        style: Constants.regularHeaading,
                      ),
                    ),
                  );
                });
          }

          // Connecting to Firebase  - Loading
          return Scaffold(
            body: Center(
              child: Text(
                'Initialization App.....',
                style: Constants.regularHeaading,
              ),
            ),
          );
        });
  }
}
